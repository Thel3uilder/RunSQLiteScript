PRAGMA foreign_keys=off;

BEGIN TRANSACTION;

ALTER TABLE sale_items RENAME TO sale_items_old;

CREATE TABLE IF NOT EXISTS sale_items 
(
	 sale_item_id INTEGER NOT NULL
	,sale_item_type VARCHAR(16) NOT NULL
	,item VARCHAR(20) NOT NULL
	,quantity DECIMAL(10,2) NOT NULL
	,quantity_metric VARCHAR(2) NOT NULL
	,amount DECIMAL(10,2) NOT NULL
	,transaction_id INTEGER NOT NULL
);

INSERT INTO sale_items(sale_item_id, sale_item_type, item, quantity, quantity_metric, amount, transaction_id)
SELECT sale_item_id, sale_item_type, item, quantity, quantity_metric, amount, transaction_id
FROM sale_items_old;

PRAGMA foreign_keys=on;

UPDATE sale_items
SET quantity = quantity || ",00";

DROP TABLE sale_items_old;

COMMIT;