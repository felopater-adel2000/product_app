package com.product.app.model;

import javax.validation.constraints.*;
import lombok.*;

import javax.persistence.*;
import java.util.Date;

@Setter
@Getter
@NoArgsConstructor
@AllArgsConstructor
@Builder
@Entity
@Table(name = "product_details")
public class ProductDetails {
    @Id
    @GeneratedValue(strategy = GenerationType.IDENTITY)
    @Column(name = "product_details_id")
    private Long id;

    @NotBlank(message = "Details name is required")
    @Size(min = 2, max = 100, message = "Details name must be between 2 and 100 characters")
    @Column(name = "name", nullable = false, length = 100)
    private String name;

    @NotNull(message = "Expiration date is required")
    @Future(message = "Expiration date must be in the future")
    @Column(name = "expiration_date", nullable = false)
    @Temporal(TemporalType.DATE)
    private Date expirationDate;

    @NotBlank(message = "Manufacturer is required")
    @Size(min = 2, max = 100, message = "Manufacturer must be between 2 and 100 characters")
    @Column(name = "manufacturer", nullable = false, length = 100)
    private String manufacturer;

    @NotNull(message = "Price is required")
    @DecimalMin(value = "0.01", message = "Price must be greater than 0")
    @Column(name = "price", nullable = false)
    private Double price;

    @Column(name = "available", nullable = false)
    private Boolean available;

    @OneToOne(fetch = FetchType.LAZY)
    @JoinColumn(name = "product_id", nullable = false, unique = true)
    private Product product;

}
