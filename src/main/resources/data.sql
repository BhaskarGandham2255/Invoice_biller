-- ========== CATEGORIES ==========
INSERT INTO CATEGORY (category_id, category_name) VALUES (101, 'Beverages');
INSERT INTO CATEGORY (category_id, category_name) VALUES (201, 'Starters');
INSERT INTO CATEGORY (category_id, category_name) VALUES (301, 'Main Course');
INSERT INTO CATEGORY (category_id, category_name) VALUES (401, 'Desserts');

-- ========== ITEMS ==========

-- Beverages
INSERT INTO ITEM (item_id, item_name, price, description, available, category_id)
VALUES (101, 'Coffee', 50, 'Hot filter coffee', true, 101);

INSERT INTO ITEM (item_id, item_name, price, description, available, category_id)
VALUES (102, 'Tea', 30, 'Masala chai', true, 101);

INSERT INTO ITEM (item_id, item_name, price, description, available, category_id)
VALUES (103, 'Fresh Lime Soda', 40, 'Sweet & salted lime soda', true, 101);

-- Starters
INSERT INTO ITEM (item_id, item_name, price, description, available, category_id)
VALUES (201, 'Veg Manchurian', 120, 'Crispy veg balls in Manchurian sauce', true, 201);

INSERT INTO ITEM (item_id, item_name, price, description, available, category_id)
VALUES (202, 'Paneer Tikka', 180, 'Grilled paneer cubes with spices', true, 201);

-- Main Course
INSERT INTO ITEM (item_id, item_name, price, description, available, category_id)
VALUES (301, 'Veg Biryani', 150, 'Hyderabadi style vegetable biryani', true, 301);

INSERT INTO ITEM (item_id, item_name, price, description, available, category_id)
VALUES (302, 'Paneer Butter Masala', 190, 'Paneer in creamy tomato gravy', true, 301);

INSERT INTO ITEM (item_id, item_name, price, description, available, category_id)
VALUES (303, 'Butter Naan', 40, 'Soft naan with butter', true, 301);

-- Desserts
INSERT INTO ITEM (item_id, item_name, price, description, available, category_id)
VALUES (401, 'Gulab Jamun', 60, 'Soft milk-solid dumplings in sugar syrup', true, 401);

INSERT INTO ITEM (item_id, item_name, price, description, available, category_id)
VALUES (402, 'Ice Cream', 70, 'Vanilla scoop with chocolate syrup', true, 401);
