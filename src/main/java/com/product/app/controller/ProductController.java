package com.product.app.controller;

import com.product.app.model.Product;
import com.product.app.model.ProductDetails;
import com.product.app.util.ProductService;

import javax.validation.Valid;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.validation.BindingResult;
import org.springframework.web.bind.annotation.*;
import org.springframework.web.servlet.mvc.support.RedirectAttributes;

import java.util.Optional;

@Controller
@RequestMapping("/")
public class ProductController {

    @Autowired
    private ProductService productService;

    @GetMapping
    public String home(Model model) {
        model.addAttribute("products", productService.listProducts());
        return "home";
    }

    @GetMapping("/product/add")
    public String addProductForm(Model model) {
        model.addAttribute("product", new Product());
        return "addProductForm";
    }

    @PostMapping("/product/add")
    public String addProduct(@ModelAttribute("product") @Valid Product product,
                             BindingResult result,
                             RedirectAttributes ra) {
        if (result.hasErrors()) return "addProductForm";
        productService.addProduct(product.getName());
        ra.addFlashAttribute("msg", "Product added");
        return "redirect:/";
    }

    @GetMapping("/product/{id}")
    public String viewMore(@PathVariable Long id, Model model, RedirectAttributes ra) {
        Optional<Product> op = productService.getProduct(id);
        if (!op.isPresent()) { ra.addFlashAttribute("err","Not found"); return "redirect:/"; }
        Product p = op.get();
        model.addAttribute("product", p);
        return "viewMore";
    }

    @GetMapping("/product/{id}/details")
    public String editDetails(@PathVariable Long id, Model model, RedirectAttributes ra) {
        Optional<Product> op = productService.getProduct(id);
        if (!op.isPresent()) { ra.addFlashAttribute("err","Not found"); return "redirect:/"; }

        ProductDetails form = Optional.ofNullable(op.get().getDetails())
                .orElse(new ProductDetails());
        model.addAttribute("details", form);
        model.addAttribute("productId", id);
        return "updateProductDetails";
    }

    @PostMapping("/product/{id}/details")
    public String saveDetails(@PathVariable Long id,
                              @ModelAttribute("details") @Valid ProductDetails details,
                              BindingResult result,
                              RedirectAttributes ra,
                              Model model) {
        if (result.hasErrors()) {
            model.addAttribute("productId", id);
            return "updateProductDetails";
        }
        productService.upsertDetails(id, details);
        ra.addFlashAttribute("msg", "Details saved");
        return "redirect:/product/" + id;
    }

    @PostMapping("/product/{id}/delete")
    public String delete(@PathVariable Long id, RedirectAttributes ra) {
        productService.deleteProduct(id);
        ra.addFlashAttribute("msg", "Deleted");
        return "redirect:/";
    }
}
