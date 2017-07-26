package com.hidear.exam.modular.system.service;

import com.hidear.exam.common.node.MenuNode;
import com.hidear.exam.common.node.ZTreeNode;

import java.util.List;
import java.util.Map;

/**
 * Created by acer on 2017/7/22.
 */
public interface IMenuService {

    List<MenuNode> getMenusNodes();

    List<MenuNode> getMenusByRoleIds(List<Integer> roleIds);

    List<Map<String, Object>> selectMenus(String menuName,Integer level);

    List<ZTreeNode> menuTreeList();

    void deleteMenuById(Integer id);
}
