package com.hidear.exam.modular.service;

import com.hidear.exam.common.node.MenuNode;

import java.util.List;

/**
 * Created by acer on 2017/7/22.
 */
public interface IMenuService {

    List<MenuNode> getMenusByRoleIds(List<Integer> roleIds);
}
