package com.hidear.exam.modular.controller;

import com.hidear.exam.common.constant.factory.ConstantFactory;
import com.hidear.exam.common.constant.state.MenuOpenStatus;
import com.hidear.exam.common.constant.state.MenuStatus;
import com.hidear.exam.common.constant.tip.SuccessTip;
import com.hidear.exam.common.constant.tip.Tip;
import com.hidear.exam.common.exception.BizExceptionEnum;
import com.hidear.exam.common.exception.BussinessException;
import com.hidear.exam.common.node.ZTreeNode;
import com.hidear.exam.common.status.IsMenu;
import com.hidear.exam.core.log.LogObjectHolder;
import com.hidear.exam.core.support.BeanKit;
import com.hidear.exam.core.util.ToolUtil;
import com.hidear.exam.modular.dao.MenuRepository;
import com.hidear.exam.modular.model.Menu;
import com.hidear.exam.modular.service.IMenuService;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.data.domain.Example;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.validation.BindingResult;
import org.springframework.web.bind.annotation.PathVariable;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.ResponseBody;

import javax.validation.Valid;
import java.util.List;
import java.util.Map;

/**
 * Created by Administrator on 2017/7/22.
 */
@Controller
@RequestMapping("/menu")
public class MenuController {

    private static String PREFIX = "/system/menu/";

    @Autowired
    MenuRepository menuRepository;

    @Autowired
    IMenuService menuService;

    @RequestMapping("")
    public String index() {
        return PREFIX + "menu.html";
    }

    /**
     * 跳转到菜单列表列表页面
     */
    @RequestMapping(value = "/menu_add")
    public String menuAdd() {
        return PREFIX + "menu_add.html";
    }

    /**
     * 跳转到菜单详情列表页面
     */
    @RequestMapping(value = "/menu_edit/{menuId}")
    public String menuEdit(@PathVariable Integer menuId, Model model) {
        if (ToolUtil.isEmpty(menuId)) {
            throw new BussinessException(BizExceptionEnum.REQUEST_NULL);
        }
        Menu menu = menuRepository.findOne(menuId);

        //获取父级菜单的id
        Menu temp = new Menu();
        temp.setCode(menu.getPcode());
        Menu pMenu = menuRepository.findOne(Example.of(temp));

        //如果父级是顶级菜单
        if (pMenu == null) {
            menu.setPcode("0");
        } else {
            //设置父级菜单的code为父级菜单的id
            menu.setPcode(String.valueOf(pMenu.getId()));
        }

        Map<String, Object> menuMap = BeanKit.beanToMap(menu);
        menuMap.put("pcodeName", ConstantFactory.me().getMenuNameByCode(temp.getCode()));
        model.addAttribute("menu", menuMap);
        LogObjectHolder.me().set(menu);
        return PREFIX + "menu_edit.html";
    }

    /**
     * 获取菜单列表
     */
    @RequestMapping(value = "/list")
    @ResponseBody
    public Object list(@RequestParam(required = false) String menuName, @RequestParam(required = false) Integer level) {

        List<Map<String, Object>> menus = menuService.selectMenus(menuName, level);

        for (Map<String, Object> map : menus) {

            map.put("statusName", ConstantFactory.me().getMenuStatusName((Integer) map.get("status")));
            map.put("isMenuName", IsMenu.valueOf((Integer) map.get("ismenu")));
        }
        return menus;
    }

    /**
     * 获取菜单列表(选择父级菜单用)
     */
    @RequestMapping(value = "/selectMenuTreeList")
    @ResponseBody
    public List<ZTreeNode> selectMenuTreeList() {
        List<ZTreeNode> roleTreeList = menuService.menuTreeList();
        roleTreeList.add(ZTreeNode.createParent());
        return roleTreeList;
    }

    @RequestMapping(value = "/add")
    @ResponseBody
    public Tip add(@Valid Menu menu, BindingResult result) {
        if (result.hasErrors()) {
            throw new BussinessException(BizExceptionEnum.REQUEST_NULL);
        }
        //设置父级菜单编号
        menuSetPcode(menu);
        System.out.println("+++++++++"+menu.getPcode());
        System.out.println("+++++++++"+menu.getPcodes());

        menu.setStatus(MenuStatus.ENABLE.getCode());
        menu.setIsopen(MenuOpenStatus.OPEN.getCode());
        menuRepository.save(menu);
        return new SuccessTip();
    }

    /**
     * 根据请求的父级菜单编号设置pcode和层级
     */
    private void menuSetPcode(@Valid Menu menu) {
        if (ToolUtil.isEmpty(menu.getPcode()) || menu.getPcode().equals("0")) {
            menu.setPcode("0");
            menu.setLevels(1);
        } else {
            int code = Integer.parseInt(menu.getPcode());
            Menu pMenu = menuRepository.findOne(code);
            Integer pLevels = pMenu.getLevels();
            menu.setPcode(pMenu.getCode());
            menu.setLevels(pLevels + 1);
            menu.setPcodes(pMenu.getPcodes() + "[" + pMenu.getCode() + "],");
        }
    }
}
