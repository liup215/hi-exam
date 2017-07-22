package com.hidear.exam.modular.service.serviceImpl;

import com.hidear.exam.common.node.MenuNode;
import com.hidear.exam.common.node.ZTreeNode;
import com.hidear.exam.modular.dao.MenuRepository;
import com.hidear.exam.modular.dao.RelationRepository;
import com.hidear.exam.modular.model.Menu;
import com.hidear.exam.modular.model.Relation;
import com.hidear.exam.modular.service.IMenuService;
import org.apache.commons.collections.map.HashedMap;
import org.springframework.beans.BeanUtils;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.data.domain.Sort;
import org.springframework.data.jpa.domain.Specification;
import org.springframework.stereotype.Service;

import javax.persistence.EntityManager;
import javax.persistence.PersistenceContext;
import javax.persistence.Query;
import javax.persistence.criteria.CriteriaBuilder;
import javax.persistence.criteria.CriteriaQuery;
import javax.persistence.criteria.Predicate;
import javax.persistence.criteria.Root;
import java.util.*;

/**
 * Created by acer on 2017/7/22.
 */
@Service
public class MenuServiceImpl implements IMenuService {

    @Autowired
    RelationRepository relationRepository;

    @Autowired
    MenuRepository menuRepository;

    @PersistenceContext
    EntityManager entityManager;

    @Override
    public List<MenuNode> getMenusNodes() {

        List<MenuNode> menuNodes = new ArrayList<>();

        List<Menu> menus = menuRepository.findAll();

        for(Menu menu:menus){
            MenuNode node = getMenuNode(menu);
            menuNodes.add(node);
        }
        return menuNodes;
    }

    @Override
    public List<MenuNode> getMenusByRoleIds(List<Integer> roleIds) {

        List<MenuNode> menuNodes = new ArrayList<>();
        Set<Integer> menusSet = new HashSet<>();
        List<Relation> relations = relationRepository.findByRoleidIn(roleIds);
        for(Relation relation:relations){
            menusSet.add(relation.getMenuid());
        }

        List<Menu> menus = menuRepository.findByIdIn(menusSet);
        for(Menu menu:menus){
            MenuNode node = getMenuNode(menu);
            menuNodes.add(node);
        }

        return menuNodes;
    }

    @Override
    public List<Map<String, Object>> selectMenus(String menuName, Integer level) {
        List<Map<String, Object>> list = new ArrayList<>();
        List<Menu> menus = menuRepository.findAll(getSpecByNameAndLevel(menuName,level));
        System.out.println(menus.size());

        for(Menu menu:menus){
            Map<String,Object> map = new HashedMap();
            map.put("id",menu.getId());
            map.put("code",menu.getCode());
            map.put("pcode",menu.getPcode());
            map.put("pcodes",menu.getPcodes());
            map.put("name",menu.getName());
            map.put("icon",menu.getIcon());
            map.put("url",menu.getUrl());
            map.put("num",menu.getNum());
            map.put("levels",menu.getLevels());
            map.put("isMenu",menu.getIsmenu());
            map.put("tips",menu.getTips());
            map.put("status",menu.getStatus());
            map.put("isOpen",menu.getIsopen());

            list.add(map);
        }

        return list;
    }

    @Override
    public List<ZTreeNode> menuTreeList() {
        List<ZTreeNode> nodes = new ArrayList<>();

        Sort sort = new Sort(Sort.Direction.ASC,"id");
        List<Menu> menus = menuRepository.findAll(sort);
        for(Menu menu:menus){
            ZTreeNode node = new ZTreeNode();
            BeanUtils.copyProperties(menu,node);

            Menu m2 = menuRepository.findByCode(menu.getPcode());
            if(m2==null){
                node.setpId(0);
                node.setIsOpen(true);
            }else {
                node.setpId(m2.getId());
                node.setIsOpen(false);
            }

            nodes.add(node);
        }

        return nodes;
    }

    private MenuNode getMenuNode(Menu menu){
        MenuNode node = new MenuNode();
        BeanUtils.copyProperties(menu,node);

        Menu m2 = menuRepository.findByCode(menu.getPcode());
        if(m2==null){
            node.setParentId(0);
        }else{
            node.setParentId(m2.getId());
        }

        System.out.println(node+"*&*&*&*&*&*&*&*&*&*&*&*&*&*&");

        return node;
    }

    private Specification<Menu> getSpecByNameAndLevel(String menuName, Integer level){
        return new Specification<Menu>() {
            @Override
            public Predicate toPredicate(Root<Menu> root, CriteriaQuery<?> criteriaQuery, CriteriaBuilder criteriaBuilder) {
                Predicate p = criteriaBuilder.equal(root.get("status"),1);

                if(menuName!=null && !menuName.trim().equals("")){
                    Predicate p1 = criteriaBuilder.like(root.get("name"),"%"+menuName+"%");
                    Predicate p2 = criteriaBuilder.like(root.get("code"),"%"+menuName+"%");

                    Predicate px = criteriaBuilder.or(p1,p2);

                    if(p!=null){
                        p = criteriaBuilder.and(p,px);
                    }

                }

                if(level!=null){
                    Predicate px = criteriaBuilder.equal(root.get("levels"),level);
                    if(p!=null){
                        p = criteriaBuilder.and(p,px);
                    }
                }

                return p;
            }
        };
    }
}
