package com.product.app.model;

import javax.validation.constraints.NotBlank;
import javax.validation.constraints.Size;
import lombok.*;

import javax.persistence.*;

@Setter
@Getter
@NoArgsConstructor
@AllArgsConstructor
@Builder
@Entity
@Table(name = "product")
public class Product {
    @Id @GeneratedValue(strategy = GenerationType.IDENTITY)
    @Column(name = "product_id")
    int id;

    @NotBlank(message = "Product name is required")
    @Size(min = 1, max = 50, message = "Product name must be between 2 and 100 characters")
    @Column(name = "name", length = 50)
    String name;

    @OneToOne(mappedBy = "product", cascade = CascadeType.ALL, fetch = FetchType.LAZY, orphanRemoval = true)
    private ProductDetails details;
}
