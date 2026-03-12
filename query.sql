SELECT * FROM fmcg
LIMIT 10;

----- 1. ubah sales_date

-- deteksi format tanggal

SELECT sales_date,
CAST(substr(sales_date, 1, 2) AS INTEGER) AS first_nnumber
FROM fmcg;

-- konversi tanggal ke (yyyy-mm-dd) //preview

SELECT 
sales_date AS original_date,
CASE
    WHEN sales_date LIKE '%/%'
    THEN
        CASE
            WHEN CAST(substr(sales_date,1,2) AS INTEGER) > 12
            THEN substr(sales_date,7,4)||'-'||substr(sales_date,4,2)||'-'||substr(sales_date,1,2)
            ELSE substr(sales_date,7,4)||'-'||substr(sales_date,1,2)||'-'||substr(sales_date,4,2)
        END
    ELSE sales_date
END AS cleaned_date
FROM fmcg;

-- konversi //UPDATE

UPDATE fmcg
SET sales_date =
CASE
    WHEN sales_date LIKE '%/%'
    THEN
        CASE
            WHEN CAST(substr(sales_date,1,2) AS INTEGER) > 12
            THEN substr(sales_date,7,4)||'-'||substr(sales_date,4,2)||'-'||substr(sales_date,1,2)
            ELSE substr(sales_date,7,4)||'-'||substr(sales_date,1,2)||'-'||substr(sales_date,4,2)
        END
    ELSE sales_date
END;

----- 2. hapus duplicate berdasarkan order_id

-- cek data duplicate

SELECT *
FROM fmcg
WHERE order_id in (
	SELECT order_id
	FROM fmcg
	GROUP by order_id
	HAVING count(*) > 1
);

-- hapus duplicate

DELETE FROM fmcg
WHERE ROWID NOT in (
	SELECT min(rowid)
	FROM fmcg
	GROUP by order_id
);

----- 3. trim nilai pada kolom product_name

SELECT product_name
FROM fmcg
LIMIT 10;

-- preview

SELECT product_name,
trim(product_name) AS clean_product
FROM fmcg
LIMIT 10;

-- UPDATE

UPDATE fmcg
SET product_name = trim(product_name);

----- 4. ubah konsistensi tulisan kolom category dengan proper

SELECT DISTINCT category
FROM fmcg;

-- preview

SELECT category,
upper(substr(category, 1,1)) || lower(substr(category, 2)) AS clean_category
FROM fmcg;

-- UPDATE

UPDATE fmcg
SET category =
upper(substr(category, 1,1)) || lower(substr(category, 2));

----- 5. ubah quantity nilai -99 menjadi 1

-- cek data

SELECT quantity
FROM fmcg
WHERE quantity = -99;

-- UPDATE

UPDATE fmcg
SET quantity = 1
WHERE quantity = -99;

----- 6. mengisi kolom total

-- preview

SELECT price,
	quantity,
	price * quantity AS total_hasil
FROM fmcg
LIMIT 5;

-- UPDATE

UPDATE fmcg
SET total = price * quantity;

----- 7. mengisi kolom total_sales

-- cek preview

SELECT total, 
	discount,
	shipping_fee,
	total_sales
FROM fmcg
limit 5;

SELECT total,
	discount,
	shipping_fee,
	(total - (total * discount) + shipping_fee) AS total_sales
FROM fmcg
LIMIT 5;

-- UPDATE

UPDATE fmcg
SET total_sales =
(total - (total * discount) + shipping_fee);


----- 8. normalisasi value channel

-- cek nilai

SELECT DISTINCT channel
FROM fmcg;

-- preview

SELECT channel,
CASE
	WHEN lower(channel) = 'offline' THEN 'Offline'
	WHEN lower(channel) in ('hijau_toko_web','online - toko hijau') THEN 'Online - Toko Hijau'
	WHEN lower(channel) in ('toko_oren_online','online - toko oren') THEN 'Online - Toko Oren'
END AS clean_channel
FROM fmcg;

-- UPDATE

UPDATE fmcg
SET channel = 
CASE
	WHEN lower(channel) = 'offline' THEN 'Offline'
	WHEN lower(channel) in ('hijau_toko_web','online - toko hijau') THEN 'Online - Toko Hijau'
	WHEN lower(channel) in ('toko_oren_online','online - toko oren') THEN 'Online - Toko Oren'
END;

----- 9. ubah konsistensi tulisan pada kolom status

-- cek

SELECT DISTINCT status
FROM fmcg;

-- preview

SELECT status,
CASE
	WHEN lower(status) = 'sukses' THEN 'Success'
	ELSE status
END AS clean_status
from fmcg
WHERE status = 'Sukses'
LIMIT 5;

-- UPDATE

UPDATE fmcg
SET status = 'Success'
WHERE status = 'Sukses';

----- 10. hapus baris yang nilainya NULL

-- cek NULL

SELECT * FROM fmcg
WHERE sales_date is NULL;

-- hapus

DELETE FROM fmcg
WHERE sales_date is NULL;