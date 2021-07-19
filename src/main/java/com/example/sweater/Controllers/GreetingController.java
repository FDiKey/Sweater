package com.example.sweater.Controllers;

import com.example.sweater.Model.Message;
import com.example.sweater.repos.MessageRepo;
import com.example.sweater.ServingWebContentApplication;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestParam;


import java.util.Map;

@Controller
public class GreetingController {
    @Autowired
    private MessageRepo messageRepo;

    @GetMapping("/")
    public String greeting(){
        return "greeting";
    }
    @GetMapping("/main")
    public String main(Map<String, Object> model)
    {
        Iterable<Message> messages = messageRepo.findAll();
        model.put("messages", messages);
        return "main";
    }

    @PostMapping(path="/add")
    public String add(@RequestParam String text, @RequestParam String tag, Map<String, Object> model){
        Message message = new Message(text, tag);
        messageRepo.save(message);
        Iterable<Message> messages = messageRepo.findAll();
        model.put("messages", messages);
        return "main";
    }

    @PostMapping(path="/filter")
    public String filter(@RequestParam String tag, Map<String, Object> model)
    {
        Iterable<Message> messages;
        if(tag != null && !tag.isEmpty())
            messages = messageRepo.findByTag(tag);
        else
            messages = messageRepo.findAll();
        model.put("messages", messages);
        return "main";
    }

}
