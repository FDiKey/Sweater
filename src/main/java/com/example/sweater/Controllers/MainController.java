package com.example.sweater.Controllers;

import com.example.sweater.Model.Message;
import com.example.sweater.Model.User;
import com.example.sweater.repos.MessageRepo;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.security.core.annotation.AuthenticationPrincipal;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestParam;

import java.util.Map;

@Controller
public class MainController {
    @Autowired
    private MessageRepo messageRepo;

    @GetMapping("/")
    public String greeting(Map<String, Object> model){
        return "greeting";
    }

    @GetMapping("/main")
    public String main(@RequestParam(required = false, defaultValue = "") String filter,
                       @AuthenticationPrincipal User user,
                                                Model model)
    {
        Iterable<Message> messages;
        if(filter != null && !filter.isEmpty() && filter != "")
            messages = messageRepo.findByTag(filter);

        else
            messages = messageRepo.findAll();
        model.addAttribute("filter", filter);
        model.addAttribute("messages", messages);

        return "main";
    }

    @PostMapping(path="/add")
    public String add(
                        @RequestParam(required = false, defaultValue = "") String filter,
                        @AuthenticationPrincipal User user,
                        @RequestParam String text, @RequestParam String tag,Model model){
        System.out.println(user.getUsername());
        Message message = new Message(text, tag, user);
        messageRepo.save(message);
        Iterable<Message> messages = messageRepo.findAll();
        model.addAttribute("filter", filter);
        model.addAttribute("messages", messages);
        return "main";
    }


    @PostMapping(path = "/logout")
    public String logout(){
        return "redirect:/login";
    }

}
