package com.watero.provider.cotroller;

import com.watero.common.entity.Employee;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RestController;

@RestController
public class EmployeeController {


    @RequestMapping("remote/employee")
    public Employee getEmployee() {
        return new Employee(1l, "Yang", 26);
    }
}
