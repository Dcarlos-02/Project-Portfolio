USE Tipa_electro_DB;
GO

CREATE TABLE membership(
membership_id INT PRIMARY KEY NOT NULL, 
membership_type VARCHAR(50),
membership_description VARCHAR(100),
annual_fee DECIMAL(8,2) NOT NULL CHECK(annual_fee>=0),
discount_percentage DECIMAL(5,2) CHECK (discount_percentage BETWEEN 0 AND 100),
duration INT NOT NULL CHECK (duration>0)
);

CREATE TABLE customer(
customer_id INT PRIMARY KEY NOT NULL,
first_name VARCHAR(50),
last_name VARCHAR(30),
email VARCHAR(70),
phone_number VARCHAR(20),
street_address VARCHAR(50),
city VARCHAR(20),
state_abbr VARCHAR(2),
zip_code VARCHAR(10),
membership_id INT NOT NULL,
customer_status VARCHAR(10) NOT NULL CHECK (customer_status IN('active', 'inactive')), 

CONSTRAINT fk_customer 
FOREIGN KEY (membership_id)
REFERENCES membership(membership_id)
);

CREATE TABLE products (
product_id INT PRIMARY KEY NOT NULL,
product_name VARCHAR(50),
category VARCHAR(50),
brand VARCHAR(50),
product_description VARCHAR(200),
unit_price DECIMAL(10,2),
product_status VARCHAR(20) NOT NULL CHECK(product_status IN('active', 'discontinued')),
supplier VARCHAR(50)
);

CREATE TABLE transactions(
transaction_id INT PRIMARY KEY NOT NULL,
customer_id INT NOT NULL,
transaction_date VARCHAR(50) NOT NULL,
payment_method VARCHAR(50),
total_amount DECIMAL(10,2) NOT NULL CHECK (total_amount>=0),
discount_amount DECIMAL NOT NULL CHECK (discount_amount>=0),
transaction_status VARCHAR(20) NOT NULL CHECK(transaction_status IN('completed', 'refunded', 'cancelled')),

CONSTRAINT fkey_transaction 
FOREIGN KEY (customer_id)
REFERENCES customer(customer_id)
);

CREATE TABLE transaction_detail(
transaction_detail_id INT PRIMARY KEY NOT NULL,
transaction_id INT NOT NULL,
product_id INT NOT NULL,
quantity INT NOT NULL CHECK (quantity>0),
unit_price DECIMAL(10,2),
discount_amount DECIMAL(10,2) NOT NULL CHECK(discount_amount>=0),
Line_total DECIMAL(10,2) NOT NULL CHECK(line_total>=0),

CONSTRAINT fk_transaction 
FOREIGN KEY (transaction_id)
REFERENCES transactions(transaction_id),

CONSTRAINT fk_product 
FOREIGN KEY (product_id)
REFERENCES products(product_id)
);

CREATE INDEX idx_customer_membership ON customer(membership_id);
CREATE INDEX idx_transaction_customer ON transactions(customer_id);
CREATE INDEX idx_transaction_date ON transactions(transaction_date);
CREATE INDEX idx_transaction_detail ON transaction_detail(transaction_id);
CREATE INDEX idx_detail_product ON transaction_detail(product_id);
CREATE INDEX idx_product_category ON products(category);
CREATE INDEX idx_product_status ON products(product_status);

