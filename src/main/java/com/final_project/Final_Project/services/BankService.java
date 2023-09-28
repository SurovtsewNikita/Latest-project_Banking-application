package com.final_project.Final_Project.services;

import com.final_project.Final_Project.utilityClasses.JsonUtil;
import com.final_project.Final_Project.utilityClasses.OperationResult;
import com.final_project.Final_Project.entity.Balance;
import com.final_project.Final_Project.entity.UserOperation;
import com.final_project.Final_Project.enums.OperationsTypes;
import com.final_project.Final_Project.repository.BalanceRepository;
import com.final_project.Final_Project.repository.OperationsRepository;
import lombok.RequiredArgsConstructor;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import java.sql.Timestamp;

import static com.final_project.Final_Project.enums.OperationsTypes.*;



@Service
@RequiredArgsConstructor
public class BankService {
    @Autowired
    private final BalanceRepository balanceRepository;

    @Autowired
    private final OperationsRepository operationsRepository;

    public String getBalance(Long id) {
        if (balanceRepository.findById(id).isPresent()) {
            return JsonUtil.writeBalanceToJson(balanceRepository.findById(id).get());
        } else {
            return JsonUtil.writeOperationResultToJson(new OperationResult()
                    .setResult(-1)
                    .setOperationMessage("Данного пользователя не существует"));
        }
    }


    public String takeMoney(Long id, Long money) {
        if (money < 0) {
            return JsonUtil.writeOperationResultToJson(new OperationResult()
                    .setResult(0)
                    .setOperationMessage("Невозможно взять отрицательную сумму"));
        }
        Balance balance;
        if (balanceRepository.findById(id).isPresent()) {
            balance = balanceRepository.findById(id).get();
        } else {
            return JsonUtil.writeOperationResultToJson(new OperationResult()
                    .setResult(-1)
                    .setOperationMessage("Данного пользователя не существует"));
        }
        if (balance.getBalance() - money < 0) {
            return JsonUtil.writeOperationResultToJson(new OperationResult()
                    .setResult(0)
                    .setOperationMessage("Недостаточно средств"));
        } else {
            balance.setBalance(balance.getBalance() - money);
            balanceRepository.save(balance);
            operation_log(id, TAKE_MONEY);
            return JsonUtil.writeOperationResultToJson(new OperationResult()
                    .setResult(1)
                    .setOperationMessage("Со счета User " + id + " снято " + money));
        }
    }

    public String putMoney(Long id, Long money) {
        if (money < 0) {
            return JsonUtil.writeOperationResultToJson(new OperationResult()
                    .setResult(0)
                    .setOperationMessage("Невозможно добавить отрицательную сумму"));
        }
        Balance balance;
        if (balanceRepository.findById(id).isPresent()) {
            balance = balanceRepository.findById(id).get();
            balance.setBalance(balance.getBalance() + money);
            operation_log(id, PUT_MONEY);
            balanceRepository.save(balance);
            return JsonUtil.writeOperationResultToJson(new OperationResult()
                    .setResult(1)
                    .setOperationMessage("На счет User " + id + " добавлено " + money));
        } else {
            return JsonUtil.writeOperationResultToJson(new OperationResult()
                    .setResult(0)
                    .setOperationMessage("Данного пользователя не существует"));
        }
    }

    public void operation_log(Long userId, OperationsTypes operationsTypes) {
        UserOperation operation = new UserOperation();
        operation.setUserId(userId);
        operation.setOperationTypeName(operationsTypes.getOperationTypeName());
        operation.setOperationTypeNumber(operationsTypes.getOperationTypeNumber());
        operation.setTimeStamp(new Timestamp(System.currentTimeMillis()));
        operationsRepository.save(operation);
    }
}
