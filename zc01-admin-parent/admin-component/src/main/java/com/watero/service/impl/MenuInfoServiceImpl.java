package com.watero.service.impl;

import com.watero.entity.MenuInfo;
import com.watero.entity.MenuInfoExample;
import com.watero.mapper.MenuInfoMapper;
import com.watero.service.MenuInfoService;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import java.util.List;

@Service
public class MenuInfoServiceImpl implements MenuInfoService {
    @Autowired
    MenuInfoMapper menuInfoMapper;

    @Override
    public List<MenuInfo> getMenuInfoList(Long id) {
        return null;
    }

    @Override
    public List<MenuInfo> getAllMenu() {
        MenuInfoExample menuInfoExample = new MenuInfoExample();
        List<MenuInfo> menuInfos = menuInfoMapper.selectByExample(menuInfoExample);
        return menuInfos;
    }
}
