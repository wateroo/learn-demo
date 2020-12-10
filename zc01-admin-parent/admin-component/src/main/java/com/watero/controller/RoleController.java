package com.watero.controller;

import com.github.pagehelper.PageInfo;
import com.watero.entity.Role;
import com.watero.service.RoleService;
import com.watero.util.ResultEntity;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.web.bind.annotation.*;

import java.util.Arrays;

@RestController
public class RoleController {

    @Autowired
    RoleService roleService;


    @GetMapping("/role")
    public ResultEntity<PageInfo<Role>> getRoleList(Role role, @RequestParam(value = "pageNum", defaultValue = "1") int pageNum,
                                                    @RequestParam(value = "pageSize", defaultValue = "5") int pageSize) {
        PageInfo<Role> pageInfo = roleService.getPageInfo(role, pageNum, pageSize);
        return ResultEntity.successWithData(pageInfo);
    }

    @GetMapping("/role/{id}")
    public ResultEntity<Role> getRole(@PathVariable(value = "id") Long id) {
        Role role = roleService.queryById(id);
        return ResultEntity.successWithData(role);
    }

    @PostMapping("/role")
    public ResultEntity addRole(@RequestBody Role role) {
        roleService.insertOrUpdateRole(role);
        return ResultEntity.successWithoutData();
    }

    @PutMapping("/role")
    public ResultEntity updateRole(@RequestBody Role role) {
        roleService.insertOrUpdateRole(role);
        return ResultEntity.successWithoutData();
    }

    @DeleteMapping("/role/{id}")
    public ResultEntity deleteRole(@PathVariable Long id) {
        roleService.deleteRole(Arrays.asList(id));
        return ResultEntity.successWithoutData();
    }


}
