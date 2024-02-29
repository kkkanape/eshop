# --BUCKET
-- Drop the table if it exists
DROP TABLE IF EXISTS buckets;
CREATE TABLE buckets
(
    id      BIGINT NOT NULL AUTO_INCREMENT,
    user_id BIGINT,
    PRIMARY KEY (id),
    CONSTRAINT buckets_fk_user FOREIGN KEY (user_id) REFERENCES users (id)
) ENGINE=InnoDB;
# --USERS
# --CATEGORY
-- Drop the table if it exists
DROP TABLE IF EXISTS categories;
CREATE TABLE categories
(
    id    BIGINT NOT NULL AUTO_INCREMENT,
    title VARCHAR(255),
    PRIMARY KEY (id)
) ENGINE=InnoDB;

# --PRODUCT
-- Drop the table if it exists
DROP TABLE IF EXISTS products;
CREATE TABLE products
(
    id    BIGINT NOT NULL AUTO_INCREMENT,
    price DECIMAL(38, 2),
    title VARCHAR(255),
    PRIMARY KEY (id)
) ENGINE=InnoDB;
-- Create the linking table for BUCKETS and PRODUCTS
-- Drop the table if it exists
DROP TABLE IF EXISTS bucket_products;
CREATE TABLE bucket_products
(
    bucket_id  BIGINT,
    product_id BIGINT,
    PRIMARY KEY (bucket_id, product_id),
    CONSTRAINT bucket_products_fk_bucket FOREIGN KEY (bucket_id) REFERENCES buckets (id),
    CONSTRAINT bucket_products_fk_product FOREIGN KEY (product_id) REFERENCES products (id)
) ENGINE=InnoDB;

# --ORDERS
-- Drop the table if it exists
DROP TABLE IF EXISTS orders;
CREATE TABLE orders
(
    id      BIGINT NOT NULL AUTO_INCREMENT,
    sum     DECIMAL(38, 2),
    created DATETIME(6),
    updated DATETIME(6),
    user_id BIGINT,
    address VARCHAR(255),
    status  ENUM('NEW', 'APPROVED', 'PAID', 'CANCELED', 'CLOSED', 'RETURNED'),
    PRIMARY KEY (id),
    CONSTRAINT orders_fk_user FOREIGN KEY (user_id) REFERENCES users (id)
) ENGINE=InnoDB;

# --ORDER DETAILS
-- Drop the table if it exists
DROP TABLE IF EXISTS orders_details;
CREATE TABLE orders_details
(
    id         BIGINT NOT NULL AUTO_INCREMENT,
    details_id BIGINT,
    amount     DECIMAL(38, 2),
    price      DECIMAL(38, 2),
    order_details_id BIGINT,
    order_id   BIGINT,
    product_id BIGINT,
    PRIMARY KEY (id),
    FOREIGN KEY (order_id) REFERENCES orders(id),
    FOREIGN KEY (product_id) REFERENCES products(id)
) ENGINE=InnoDB;
DROP TABLE IF EXISTS products_categories;
CREATE TABLE products_categories
(
    product_id BIGINT,
    category_id BIGINT,
    PRIMARY KEY (product_id, category_id),
    CONSTRAINT products_categories_fk_product FOREIGN KEY (product_id) REFERENCES products (id),
    CONSTRAINT products_categories_fk_category FOREIGN KEY (category_id) REFERENCES categories (id)
) ENGINE=InnoDB;



