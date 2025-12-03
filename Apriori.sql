CREATE DATABASE apriori;
USE apriori;
CREATE TABLE transactions (
    transaction_id INT,
    item VARCHAR(255)
);

INSERT INTO transactions (transaction_id, item) VALUES
(1, 'Milk'), (1, 'Bread'), (1, 'Butter'),
(2, 'Bread'), (2, 'Butter'),
(3, 'Milk'), (3, 'Butter'),
(4, 'Bread'), (4, 'Eggs'),
(5, 'Milk'), (5, 'Bread'), (5, 'Butter'), (5, 'Eggs');

SELECT item, COUNT(*) AS support
FROM transactions
GROUP BY item
HAVING COUNT(*) >= 2;  
SELECT t1.item AS item1, t2.item AS item2, COUNT(*) AS support
FROM transactions t1
JOIN transactions t2
ON t1.transaction_id = t2.transaction_id AND t1.item < t2.item
GROUP BY t1.item, t2.item
HAVING COUNT(*) >= 2;  
SELECT t1.item AS item1, t2.item AS item2, COUNT(*) AS support
FROM transactions t1
JOIN transactions t2
ON t1.transaction_id = t2.transaction_id AND t1.item < t2.item
GROUP BY t1.item, t2.item
HAVING COUNT(*) >= 2; 
SELECT t1.item AS item1, t2.item AS item2, t3.item AS item3, COUNT(*) AS support
FROM transactions t1
JOIN transactions t2 ON t1.transaction_id = t2.transaction_id AND t1.item < t2.item
JOIN transactions t3 ON t1.transaction_id = t3.transaction_id AND t2.item < t3.item
GROUP BY t1.item, t2.item, t3.item
HAVING COUNT(*) >= 2;  
SELECT t1.item AS item1, t2.item AS item2, 
       COUNT(*) AS support_item1_item2, 
       COUNT(*) / (SELECT COUNT(*) FROM transactions t3 WHERE t3.item = t1.item) AS confidence
FROM transactions t1
JOIN transactions t2 ON t1.transaction_id = t2.transaction_id
WHERE t1.item = 'Milk' AND t2.item = 'Bread'
GROUP BY t1.item, t2.item;
