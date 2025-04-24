# E-commerce Database Schema

This repository contains the SQL script for creating a database schema designed for an e-commerce platform. The schema includes tables for products, brands, categories, variations, sizes, colors, images, and attributes. It establishes relationships between these entities to manage product listings, variations, inventory, and additional product-specific attributes efficiently.

## Database Setup

1. **Create the Database**:  
   This command creates a new database for the e-commerce platform.
   ```sql
   CREATE DATABASE ecommerce_db;
   ```

2. **Use the Database**:  
   This command sets the current database to `ecommerce_db`.
   ```sql
   USE ecommerce_db;
   ```

## Table Descriptions

### 🏷️ `brand`
This table stores information about brands available on the platform.

| Column        | Type          | Description                                   |
|---------------|---------------|-----------------------------------------------|
| `brand_id`    | INT           | Primary Key, Auto Increment                   |
| `name`        | VARCHAR(100)   | Name of the brand                             |
| `description` | TEXT          | Description of the brand                      |
| `logo_url`    | VARCHAR(255)   | URL to the brand's logo image                 |

---

### 🗂️ `product_category`
This table stores product categories for organizing products.

| Column        | Type          | Description                                   |
|---------------|---------------|-----------------------------------------------|
| `category_id` | INT           | Primary Key, Auto Increment                   |
| `name`        | VARCHAR(100)   | Name of the product category                  |
| `description` | TEXT          | Description of the product category           |

---

### 📦 `product`
This table stores the basic information about each product.

| Column        | Type          | Description                                   |
|---------------|---------------|-----------------------------------------------|
| `product_id`  | INT           | Primary Key, Auto Increment                   |
| `name`        | VARCHAR(150)   | Name of the product                           |
| `brand_id`    | INT           | Foreign Key referencing `brand(brand_id)`     |
| `category_id` | INT           | Foreign Key referencing `product_category(category_id)` |
| `base_price`  | DECIMAL(10,2)  | Base price of the product                     |
| `description` | TEXT          | Description of the product                    |

---

### 🖼️ `product_image`
This table stores the images related to products.

| Column        | Type          | Description                                   |
|---------------|---------------|-----------------------------------------------|
| `image_id`    | INT           | Primary Key, Auto Increment                   |
| `product_id`  | INT           | Foreign Key referencing `product(product_id)` |
| `image_url`   | VARCHAR(255)   | URL to the image                              |
| `alt_text`    | VARCHAR(255)   | Alt text for the image                        |

---

### 🎨 `color`
This table stores color information for product variations.

| Column        | Type          | Description                                   |
|---------------|---------------|-----------------------------------------------|
| `color_id`    | INT           | Primary Key, Auto Increment                   |
| `name`        | VARCHAR(50)    | Name of the color                             |
| `hex_code`    | VARCHAR(7)     | Hex color code for the color                  |

---

### 📏 `size_category`
This table stores categories of sizes for products (e.g., small, medium, large).

| Column            | Type        | Description                                  |
|-------------------|-------------|----------------------------------------------|
| `size_category_id`| INT         | Primary Key, Auto Increment                  |
| `name`            | VARCHAR(100)| Name of the size category                    |

---

### 📐 `size_option`
This table stores specific size options for each size category.

| Column         | Type           | Description                                   |
|----------------|----------------|-----------------------------------------------|
| `size_option_id`| INT          | Primary Key, Auto Increment                   |
| `size_category_id`| INT        | Foreign Key referencing `size_category(size_category_id)` |
| `label`        | VARCHAR(50)     | Label for the size option (e.g., S, M, L)     |
| `value`        | VARCHAR(50)     | Value for the size option (e.g., 10, 12)      |

---

### 🔄 `product_variation`
This table stores variations of products, based on attributes like color and size.

| Column           | Type           | Description                                   |
|------------------|----------------|-----------------------------------------------|
| `variation_id`   | INT            | Primary Key, Auto Increment                   |
| `product_id`     | INT            | Foreign Key referencing `product(product_id)` |
| `color_id`       | INT            | Foreign Key referencing `color(color_id)`     |
| `size_option_id` | INT            | Foreign Key referencing `size_option(size_option_id)` |

---

### 🧾 `product_item`
This table stores the individual items for sale, including SKU, price, and stock quantity.

| Column          | Type           | Description                                   |
|-----------------|----------------|-----------------------------------------------|
| `item_id`       | INT            | Primary Key, Auto Increment                   |
| `variation_id`  | INT            | Foreign Key referencing `product_variation(variation_id)` |
| `sku`           | VARCHAR(100)   | Unique SKU for the item                       |
| `price`         | DECIMAL(10,2)  | Price of the item                             |
| `stock_quantity`| INT           | Quantity in stock                             |

---

### 📚 `attribute_category`
This table stores categories for product attributes (e.g., material, style).

| Column               | Type        | Description                                 |
|----------------------|-------------|---------------------------------------------|
| `attribute_category_id`| INT        | Primary Key, Auto Increment                 |
| `name`               | VARCHAR(100)| Name of the attribute category              |

---

### 🧪 `attribute_type`
This table stores types for product attributes (e.g., string, integer).

| Column            | Type        | Description                                 |
|-------------------|-------------|---------------------------------------------|
| `attribute_type_id`| INT         | Primary Key, Auto Increment                 |
| `name`            | VARCHAR(50) | Name of the attribute type                  |

---

### 🧵 `product_attribute`
This table stores attributes related to products, such as material or style.

| Column                 | Type          | Description                                   |
|------------------------|---------------|-----------------------------------------------|
| `attribute_id`         | INT           | Primary Key, Auto Increment                   |
| `product_id`           | INT           | Foreign Key referencing `product(product_id)` |
| `attribute_category_id`| INT           | Foreign Key referencing `attribute_category(attribute_category_id)` |
| `attribute_type_id`    | INT           | Foreign Key referencing `attribute_type(attribute_type_id)` |
| `name`                 | VARCHAR(100)  | Name of the attribute                         |
| `value`                | TEXT          | Value of the attribute                        |

---

## Usage

To use this database schema, simply run the provided SQL script on your SQL database engine. The script will create all necessary tables with the required relationships and constraints.
