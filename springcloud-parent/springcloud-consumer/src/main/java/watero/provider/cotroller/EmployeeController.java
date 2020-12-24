package watero.provider.cotroller;

import com.watero.common.entity.Employee;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RestController;
import org.springframework.web.client.RestTemplate;

@RestController
public class EmployeeController {

    @Autowired
    private RestTemplate restTemplate;

    @RequestMapping("remote/employee")
    public Employee getRemoteEmployee() {
//        return restTemplate.getForObject("http://127.0.0.1:8080/remote/employee", Employee.class);
        return restTemplate.getForObject("http://springcloud-provider/remote/employee", Employee.class);
    }
}
