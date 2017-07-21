package com.hidear.exam.modular.service.serviceImpl;

import com.hidear.exam.common.node.MenuNode;
import com.hidear.exam.modular.dao.MenuRepository;
import com.hidear.exam.modular.dao.RelationRepository;
import com.hidear.exam.modular.model.Menu;
import com.hidear.exam.modular.model.Relation;
import com.hidear.exam.modular.service.IMenuService;
import org.springframework.beans.factory.annotation.Autowired;

import java.util.*;

/**
 * Created by acer on 2017/7/22.
 */
public class MenuServiceImpl implements IMenuService {

    @Autowired
    RelationRepository relationRepository;

    @Autowired
    MenuRepository menuRepository;

    @Override
    public List<MenuNode> getMenusByRoleIds(List<Integer> roleIds) {

        List<MenuNode> menuNodes = new ArrayList<>();
        Set<Integer> menusSet = new HashSet<>();
        List<Relation> relations = new ArrayList<>();
        for(Integer id:roleIds){
            relations = relationRepository.findByRoleidIn(roleIds);
            for(Relation relation:relations){
                menusSet.add(relation.getMenuid());
            }
        }

        List<Menu> menus = menuRepository.findByIdIn(menusSet);
        for(Menu menu:menus){
            MenuNode node = new MenuNode();
            node.setId(menu.getId());
            node.setIcon(menu.getIcon());
            node.setIsmenu(menu.getIsmenu());
            node.setLevels(menu.getLevels());
            node.setName(menu.getName());
            node.setNum(menu.getNum());
            node.setUrl(menu.getUrl());
        }

        return null;
    }
}
