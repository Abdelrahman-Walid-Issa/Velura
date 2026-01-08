BEGIN TRANSACTION;
CREATE TABLE IF NOT EXISTS "Address" (
	"address_id"	INT NOT NULL,
	"user_id"	INT NOT NULL,
	"city"	VARCHAR(50),
	"state"	VARCHAR(50),
	"country"	VARCHAR(50),
	CONSTRAINT "Address_PK" PRIMARY KEY("address_id"),
	CONSTRAINT "Address_User_FK" FOREIGN KEY("user_id") REFERENCES "User"("user_id")
);
CREATE TABLE IF NOT EXISTS "Cart" (
	"cart_id"	INT NOT NULL,
	"user_id"	INT NOT NULL,
	CONSTRAINT "Cart_PK" PRIMARY KEY("cart_id"),
	CONSTRAINT "Cart_User_FK" FOREIGN KEY("user_id") REFERENCES "User"("user_id")
);
CREATE TABLE IF NOT EXISTS "Cart_Product" (
	"cart_id"	INT NOT NULL,
	"product_id"	INT NOT NULL,
	CONSTRAINT "Cart_Product_PK" PRIMARY KEY("cart_id","product_id"),
	CONSTRAINT "CP_Cart_FK" FOREIGN KEY("cart_id") REFERENCES "Cart"("cart_id"),
	CONSTRAINT "CP_Product_FK" FOREIGN KEY("product_id") REFERENCES "Product"("product_id")
);
CREATE TABLE IF NOT EXISTS "Category" (
	"category_id"	INT NOT NULL,
	"name"	VARCHAR(50),
	CONSTRAINT "Category_PK" PRIMARY KEY("category_id")
);
CREATE TABLE IF NOT EXISTS "Discount" (
	"discount_id"	INT NOT NULL,
	"product_id"	INT NOT NULL,
	"discount_code"	VARCHAR(6),
	"percentage"	DECIMAL(5, 2),
	"expiry_date"	DATE,
	CONSTRAINT "Discount_PK" PRIMARY KEY("discount_id"),
	CONSTRAINT "Discount_Product_FK" FOREIGN KEY("product_id") REFERENCES "Product"("product_id")
);
CREATE TABLE IF NOT EXISTS "Order_Product" (
	"order_no"	INT NOT NULL,
	"product_id"	INT NOT NULL,
	CONSTRAINT "Order_Product_PK" PRIMARY KEY("order_no","product_id"),
	CONSTRAINT "OP_Order_FK" FOREIGN KEY("order_no") REFERENCES "Orders"("order_no"),
	CONSTRAINT "OP_Product_FK" FOREIGN KEY("product_id") REFERENCES "Product"("product_id")
);
CREATE TABLE IF NOT EXISTS "Orders" (
	"order_no"	INT NOT NULL,
	"user_id"	INT NOT NULL,
	"order_date"	DATE,
	"order_amount"	DECIMAL(10, 2),
	CONSTRAINT "Orders_PK" PRIMARY KEY("order_no"),
	CONSTRAINT "Orders_User_FK" FOREIGN KEY("user_id") REFERENCES "User"("user_id")
);
CREATE TABLE IF NOT EXISTS "Payment" (
	"payment_id"	INT NOT NULL,
	"user_id"	INT NOT NULL,
	"payment_method"	VARCHAR(50),
	"payment_amount"	DECIMAL(10, 2),
	CONSTRAINT "Payment_PK" PRIMARY KEY("payment_id"),
	CONSTRAINT "Payment_User_FK" FOREIGN KEY("user_id") REFERENCES "User"("user_id")
);
CREATE TABLE IF NOT EXISTS "Product" (
	"product_id"	INT NOT NULL,
	"name"	VARCHAR(100),
	"description"	VARCHAR(255),
	"price"	DECIMAL(10, 2),
	"category_id"	INT NOT NULL,
	CONSTRAINT "Product_PK" PRIMARY KEY("product_id"),
	CONSTRAINT "Product_Category_FK" FOREIGN KEY("category_id") REFERENCES "Category"("category_id")
);
CREATE TABLE IF NOT EXISTS "Review" (
	"review_id"	INT NOT NULL,
	"user_id"	INT NOT NULL,
	"product_id"	INT NOT NULL,
	"rating"	INT,
	"comments"	VARCHAR(255),
	CONSTRAINT "Review_PK" PRIMARY KEY("review_id"),
	CONSTRAINT "Review_Product_FK" FOREIGN KEY("product_id") REFERENCES "Product"("product_id"),
	CONSTRAINT "Review_User_FK" FOREIGN KEY("user_id") REFERENCES "User"("user_id")
);
CREATE TABLE IF NOT EXISTS "Tracking_Detail" (
	"tracking_id"	INT NOT NULL,
	"order_no"	INT NOT NULL,
	CONSTRAINT "Tracking_PK" PRIMARY KEY("tracking_id"),
	CONSTRAINT "Tracking_Order_FK" FOREIGN KEY("order_no") REFERENCES "Orders"("order_no")
);
CREATE TABLE IF NOT EXISTS "User" (
	"user_id"	INT NOT NULL,
	"first_name"	VARCHAR(50),
	"last_name"	VARCHAR(50),
	"email"	VARCHAR(100),
	"password"	VARCHAR(100),
	"phone"	VARCHAR(20),
	CONSTRAINT "User_email_UQ" UNIQUE("email"),
	CONSTRAINT "User_PK" PRIMARY KEY("user_id")
);
CREATE TABLE IF NOT EXISTS "admin" (
	"admin_id"	INT AUTO_INCREMENT,
	"email"	VARCHAR(255) NOT NULL UNIQUE,
	"name"	VARCHAR(100) NOT NULL,
	"password"	VARCHAR(255) NOT NULL,
	"role"	VARCHAR(50) NOT NULL,
	PRIMARY KEY("admin_id")
);
COMMIT;
