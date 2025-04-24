CREATE DATABASE ecommerce_db;
USE ecommerce_db;

-- 🏷️ brand
CREATE TABLE brand (
    brand_id INT PRIMARY KEY AUTO_INCREMENT,
    name VARCHAR(100) NOT NULL,
    description TEXT,
    logo_url VARCHAR(255)
);

-- 🗂️ product_category
CREATE TABLE product_category (
    category_id INT PRIMARY KEY AUTO_INCREMENT,
    name VARCHAR(100) NOT NULL,
    description TEXT
);

-- 📦 product
CREATE TABLE product (
    product_id INT PRIMARY KEY AUTO_INCREMENT,
    name VARCHAR(150) NOT NULL,
    brand_id INT,
    category_id INT,
    base_price DECIMAL(10,2),
    description TEXT,
    FOREIGN KEY (brand_id) REFERENCES brand(brand_id),
    FOREIGN KEY (category_id) REFERENCES product_category(category_id)
);

-- 🖼️ product_image
CREATE TABLE product_image (
    image_id INT PRIMARY KEY AUTO_INCREMENT,
    product_id INT NOT NULL,
    image_url VARCHAR(255) NOT NULL,
    alt_text VARCHAR(255),
    FOREIGN KEY (product_id) REFERENCES product(product_id)
);

-- 🎨 color
CREATE TABLE color (
    color_id INT PRIMARY KEY AUTO_INCREMENT,
    name VARCHAR(50) NOT NULL,
    hex_code VARCHAR(7)
);

-- 📏 size_category
CREATE TABLE size_category (
    size_category_id INT PRIMARY KEY AUTO_INCREMENT,
    name VARCHAR(100) NOT NULL
);

-- 📐 size_option
CREATE TABLE size_option (
    size_option_id INT PRIMARY KEY AUTO_INCREMENT,
    size_category_id INT NOT NULL,
    label VARCHAR(50) NOT NULL,
    value VARCHAR(50),
    FOREIGN KEY (size_category_id) REFERENCES size_category(size_category_id)
);

-- 🔄 product_variation
CREATE TABLE product_variation (
    variation_id INT PRIMARY KEY AUTO_INCREMENT,
    product_id INT NOT NULL,
    color_id INT,
    size_option_id INT,
    FOREIGN KEY (product_id) REFERENCES product(product_id),
    FOREIGN KEY (color_id) REFERENCES color(color_id),
    FOREIGN KEY (size_option_id) REFERENCES size_option(size_option_id)
);

-- 🧾 product_item
CREATE TABLE product_item (
    item_id INT PRIMARY KEY AUTO_INCREMENT,
    variation_id INT NOT NULL,
    sku VARCHAR(100) UNIQUE NOT NULL,
    price DECIMAL(10,2),
    stock_quantity INT DEFAULT 0,
    FOREIGN KEY (variation_id) REFERENCES product_variation(variation_id)
);

-- 📚 attribute_category
CREATE TABLE attribute_category (
    attribute_category_id INT PRIMARY KEY AUTO_INCREMENT,
    name VARCHAR(100) NOT NULL
);

-- 🧪 attribute_type
CREATE TABLE attribute_type (
    attribute_type_id INT PRIMARY KEY AUTO_INCREMENT,
    name VARCHAR(50) NOT NULL
);

-- 🧵 product_attribute
CREATE TABLE product_attribute (
    attribute_id INT PRIMARY KEY AUTO_INCREMENT,
    product_id INT NOT NULL,
    attribute_category_id INT NOT NULL,
    attribute_type_id INT NOT NULL,
    name VARCHAR(100) NOT NULL,
    value TEXT NOT NULL,
    FOREIGN KEY (product_id) REFERENCES product(product_id),
    FOREIGN KEY (attribute_category_id) REFERENCES attribute_category(attribute_category_id),
    FOREIGN KEY (attribute_type_id) REFERENCES attribute_type(attribute_type_id)
);
