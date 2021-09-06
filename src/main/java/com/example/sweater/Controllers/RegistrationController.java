package com.example.sweater.Controllers;

import com.example.sweater.Model.User;
import com.example.sweater.service.UserService;
import com.fasterxml.jackson.core.JsonToken;
import org.codehaus.plexus.util.StringUtils;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.validation.BindingResult;
import org.springframework.web.bind.annotation.*;

import javax.validation.Valid;
import java.util.Map;

@Controller
public class RegistrationController {
    @Autowired
    private UserService userSecvice;

    @GetMapping("/registration")
    public String registration(){
        return "registration";
    }
    @PostMapping("/registration")
    public String addUser(
                          @RequestParam("password2") String passwordConfirm,
                          @Valid User user,
                          BindingResult bindingResult, Model model )
    {
        boolean isConfirmEmpty = StringUtils.isEmpty(passwordConfirm);

        if(isConfirmEmpty)
        {
            model.addAttribute("password2Error", "Passwords are different!");
        }

        if(user.getPassword() != null && !user.getPassword().equals(passwordConfirm))
            model.addAttribute("passwordError", "passwords are different");

        if(isConfirmEmpty || bindingResult.hasErrors())
        {
            Map<String, String> errors = ControllerUtils.getErrors(bindingResult);
            model.mergeAttributes(errors);
            return "registration";
        }

        if(!userSecvice.addUser(user)){
            model.addAttribute("message", "User exists!");
            return "registration";
        }

        return "redirect:/login";
    }

    @GetMapping("/activate/{code}")
    public String activate(Model model, @PathVariable("code") String code){
        boolean isActivated = userSecvice.activateUser(code);

        if(isActivated) {
            model.addAttribute("messageType", "success");
            model.addAttribute("message", "User succesfuly activated!");
        }
        else {
            model.addAttribute("messageType", "danger");
            model.addAttribute("message", "Activation code is not found");
        }

        return "login";
    }

    @GetMapping("test")
    public String test(@ModelAttribute("model") Model model)
    {
        model.addAttribute("message", "111111");
        return "login";
    }
}
