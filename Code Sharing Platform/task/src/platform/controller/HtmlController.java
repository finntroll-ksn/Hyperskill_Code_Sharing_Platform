package platform.controller;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.PathVariable;
import platform.entity.Code;
import platform.service.CodeService;

import java.util.ArrayList;
import java.util.List;

@Controller
public class HtmlController {
    private CodeService service;

    public HtmlController() {
    }

    @Autowired
    public HtmlController(CodeService service) {
        this.service = service;
    }

    @GetMapping(path = "/code/{id}", produces = "text/html")
    public String getHtmlCode(@PathVariable("id") String id, Model model) {
        Code responseCode = service.getCode(id);

        if (responseCode.isViewLimit()) {
            service.updateViewById(id);
            responseCode = service.getCode(id);
        }

        if (responseCode.isTimeLimit()) {
            long currentSecond = System.currentTimeMillis();
            service.updateTimeById(id, currentSecond);
            responseCode = service.getCode(id);
        }

        model.addAttribute("responseCode", responseCode);

        return "code";
    }

    @GetMapping(path = "/code/latest", produces = "text/html")
    public String getHtmlLatestCode(Model model) {
        List<Code> lastCodesStore = service.getLastCode();
        model.addAttribute("lastCodesStore", lastCodesStore);

        return "lastcodes";
    }


    @GetMapping(path = "/code/new", produces = "text/html")
    public String getHtmlCodeNew() {
        return "newcode";
    }
}
