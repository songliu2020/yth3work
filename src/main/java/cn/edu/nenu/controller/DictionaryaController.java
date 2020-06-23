package cn.edu.nenu.controller;

import cn.edu.nenu.config.Constants;
import cn.edu.nenu.config.HttpServlet;
import cn.edu.nenu.domain.Dictionarya;
import cn.edu.nenu.service.DictionaryaService;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.data.domain.Page;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.PathVariable;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.servlet.mvc.support.RedirectAttributes;

import javax.servlet.ServletRequest;
import javax.validation.Valid;
import java.util.Map;

import static cn.edu.nenu.config.Constants.PAGE_SIZE;

@Controller
@RequestMapping("/dicta")
public class DictionaryaController {


    @Autowired
    DictionaryaService dictService;

    /**
     * 列表页面
     */
    @RequestMapping("")
    public String list(@RequestParam(value = "sortType", defaultValue = "auto") String sortType,
                       @RequestParam(value = "page", defaultValue = "1") int pageNumber, Model model, ServletRequest request){

        Map<String, Object> searchParams = HttpServlet.getParametersStartingWith(request, "s_");
        Page<Dictionarya> dicts = dictService.getEntityPage(searchParams, pageNumber, PAGE_SIZE, sortType);
        model.addAttribute("dicts", dicts);
        model.addAttribute("sortType", sortType);
        model.addAttribute("PAGE_SIZE", PAGE_SIZE);
        model.addAttribute("searchParams", HttpServlet.encodeParameterStringWithPrefix(searchParams, "s_"));
        String path = "/WEB-INF/views/dicta/list.jsp";
        return "dicta/list";
    }

    /**
     * 进入新增页面
     */
    @GetMapping(value = "create")
    public String createForm(Model model) {
        model.addAttribute("dicta", new Dictionarya());
        model.addAttribute("action", "create");
        return "dicta/form";
    }

    /**
     * 新增页面，提交保存
     * @author zhangyj, 2020.05.21
     */
    @PostMapping(value = "create")
    public String create(@Valid Dictionarya newDict, RedirectAttributes redirectAttributes) {
        float sort = dictService.getMaxSort();
        newDict.setSort(sort+1);
        newDict.setStatus(Constants.Status.ENABLE);
        dictService.save(newDict);
        redirectAttributes.addFlashAttribute("message", "创建文章成功");
        return "redirect:/dicta/";
    }

    /**
     * 进入编辑页面
     */
    @GetMapping(value = "update/{id}")
    public String updateForm(@PathVariable("id") Long pkId, Model model){
        Dictionarya dict =  dictService.findOne(pkId);
        model.addAttribute("dicta",dict);
        model.addAttribute("action", "update");
        return "dicta/form";
    }

    /**
     * 页面编辑后，保存
     */
    @PostMapping(value = "update")
    public String update(@Valid Dictionarya dict, RedirectAttributes redirectAttributes){
        Long pkId = dict.getId();
        Dictionarya newDict = dictService.findOne(pkId);
        newDict.setType(dict.getType());
        newDict.setCode(dict.getCode());
        newDict.setName(dict.getName());

        dictService.save(newDict);
        redirectAttributes.addFlashAttribute("message", "更改文章信息成功");
        return "redirect:/dicta/";
    }

    /**
     * 根据ID删除单个文章
     */
    @GetMapping(value = "delete/{id}")
    public String delete(@PathVariable("id") Long pkId, RedirectAttributes redirectAttributes) {
        String message = "删除文章成功";
        try {
            dictService.remove(pkId);
        }catch (Exception e){
            message = "删除文章失败，该文章已打开";
        }
        redirectAttributes.addFlashAttribute("message", message);
        return "redirect:/dicta/";
    }

    /**
     * 批量删除
     */
    @PostMapping(value = "delete")
    public String deleteBatch(ServletRequest request,RedirectAttributes redirectAttributes){
        String[] chkIds = request.getParameterValues("chkIds");
        for (String id:chkIds){
            dictService.remove(Long.valueOf(id));
        }
        return "redirect:/dicta/";
    }
}
