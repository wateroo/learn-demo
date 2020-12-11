package com.watero.controller;

import com.watero.entity.MenuInfo;
import com.watero.service.MenuInfoService;
import com.watero.util.ResultEntity;
import org.apache.commons.lang3.StringUtils;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.RestController;

import java.util.List;
import java.util.Objects;

@RestController
public class MenuInfoController {

    @Autowired
    MenuInfoService menuInfoService;

    @GetMapping("/menu")
    public ResultEntity<MenuInfo> getMenuList() {
        List<MenuInfo> allMenuList = menuInfoService.getAllMenu();
        MenuInfo root = null;
        if (allMenuList != null && allMenuList.size() > 0) {
            for (MenuInfo menu : allMenuList) {
                //找出所有子节点加进去
                for (MenuInfo maybeSon : allMenuList) {
                    if(Objects.equals(menu.getId(),maybeSon.getPid())){
                        menu.getChildList().add(maybeSon);
                    }
                }


//                Long pid = menu.getPid();
//                if (pid == null) {//根节点
//                    root = menu;
//                    continue;//根节点是没有父节点的就直接跳过当前的循环
//                }
//                for (MenuInfo maybeFather : allMenuList) {//内循环,对比找出外循环menu的父节点对象，并把外循环中的menu加入到父节点对象的子节点中
//                    if (Objects.equals(maybeFather.getId(), pid)) {//不是根节点，就曲找到所有的
//                        maybeFather.getChildList().add(menu);
//                        break;
//                    }
//                }
            }
        }
        return new ResultEntity<MenuInfo>().successWithData(root);
    }
}
