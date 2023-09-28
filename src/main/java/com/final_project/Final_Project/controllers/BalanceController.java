package com.final_project.Final_Project.controllers;

import com.final_project.Final_Project.services.BankService;
import lombok.RequiredArgsConstructor;
import org.springframework.web.bind.annotation.*;

@RestController
@RequiredArgsConstructor
public class BalanceController {
    public final BankService bankService;

    @RequestMapping("/getBalance")
    @ResponseBody
    String getBalance(@RequestParam(value = "id") Long id) {
        return bankService.getBalance(id);
    }

    @RequestMapping("/putMoney")
    @ResponseBody
    String putMoney(@RequestParam(value = "id") Long id,
                    @RequestParam(value = "money") Long money) {
        return bankService.putMoney(id, money);
    }

    @RequestMapping("/takeMoney")
    @ResponseBody
    String takeMoney(@RequestParam(value = "id") Long id,
                     @RequestParam(value = "money") Long money) {
        return bankService.takeMoney(id, money);
    }

}
