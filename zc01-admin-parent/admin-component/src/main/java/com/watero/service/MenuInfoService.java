package com.watero.service;

import com.watero.entity.MenuInfo;

import java.util.List;

public interface MenuInfoService {
    List<MenuInfo> getMenuInfoList(Long id);

    List<MenuInfo> getAllMenu();
}
