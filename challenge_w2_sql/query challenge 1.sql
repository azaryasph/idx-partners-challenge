--- === Create table === ---

-- Create table for transaction sales
CREATE TABLE transaksi_penjualan(
    transaksi_id INT,  -- Unique identifier for each transaction
    tanggal_transaksi DATE,  -- Date of the transaction
    jumlah_barang_terjual INT,  -- Number of items sold in the transaction
    total_penjualan DOUBLE PRECISION,  -- Total sales amount from the transaction
    produk_id INT,  -- Identifier for the product sold
    pelanggan_id INT,  -- Identifier for the customer who made the purchase
    metode_pembayaran_id INT  -- Identifier for the payment method used
);

-- Create table for products
CREATE TABLE produk(
    produk_id INT,  -- Unique identifier for each product
    nama_produk VARCHAR,  -- Name of the product
    kategori_produk VARCHAR,  -- Category of the product
    harga_produk DOUBLE PRECISION  -- Price of the product
);

-- Create table for payment methods
CREATE TABLE metode_pembayaran(
    metode_pembayaran_id INT,  -- Unique identifier for each payment method
    nama_metode VARCHAR,  -- Name of the payment method
    tipe_metode VARCHAR,  -- Type of the payment method
    detail_metode VARCHAR  -- Details of the payment method
);

-- Create table for customers
CREATE TABLE pelanggan(
    pelanggan_id INT,  -- Unique identifier for each customer
    nama_pelanggan VARCHAR,  -- Name of the customer
    alamat VARCHAR,  -- Address of the customer
    email VARCHAR  -- Email of the customer
);

-- Create table for time
CREATE TABLE waktu(
    tanggal DATE,  -- Date of the transaction
    tahun INT,  -- Year of the transaction
    bulan INT,  -- Month of the transaction
    trimester INT,  -- Quarter of the year of the transaction
    musim VARCHAR,  -- Season of the year of the transaction
    transaksi_id INT  -- Identifier for the transaction
);

-- Create table for location
CREATE TABLE lokasi(
    lokasi_id INT,  -- Unique identifier for each location
    nama_lokasi VARCHAR,  -- Name of the location
    negara VARCHAR,  -- Country of the location
    kota VARCHAR,  -- City of the location
    transaksi_id INT  -- Identifier for the transaction
);


--- === Set PK === --- 

-- Add a primary key to the 'transaksi_penjualan' table
ALTER TABLE transaksi_penjualan
ADD PRIMARY KEY(transaksi_id);

-- Add a primary key to the 'produk' table
ALTER TABLE produk
ADD PRIMARY KEY(produk_id);

-- Add a primary key to the 'metode_pembayaran' table
ALTER TABLE metode_pembayaran
ADD PRIMARY KEY(metode_pembayaran_id);

-- Add a primary key to the 'pelanggan' table
ALTER TABLE pelanggan
ADD PRIMARY KEY(pelanggan_id);

-- Add a primary key to the 'waktu' table
ALTER TABLE waktu
ADD PRIMARY KEY(tanggal);

-- Add a primary key to the 'lokasi' table
ALTER TABLE lokasi
ADD PRIMARY KEY(lokasi_id);


--- === SET FK === --- 

-- Add a foreign key constraint to the 'transaksi_penjualan' table
-- The 'produk_id' in 'transaksi_penjualan' references the 'produk_id' in the 'produk' table
ALTER TABLE transaksi_penjualan
ADD CONSTRAINT fk_produk_id
FOREIGN KEY(produk_id)
REFERENCES produk;

-- Add a foreign key constraint to the 'transaksi_penjualan' table
-- The 'pelanggan_id' in 'transaksi_penjualan' references the 'pelanggan_id' in the 'pelanggan' table
ALTER TABLE transaksi_penjualan
ADD CONSTRAINT fk_pelanggan_id
FOREIGN KEY(pelanggan_id)
REFERENCES pelanggan;

-- Add a foreign key constraint to the 'transaksi_penjualan' table
-- The 'metode_pembayaran_id' in 'transaksi_penjualan' references the 'metode_pembayaran_id' in the 'metode_pembayaran' table
ALTER TABLE transaksi_penjualan
ADD CONSTRAINT fk_pembayaran_id
FOREIGN KEY(metode_pembayaran_id)
REFERENCES metode_pembayaran;

-- Add a foreign key constraint to the 'waktu' table
-- The 'transaksi_id' in 'waktu' references the 'transaksi_id' in the 'transaksi_penjualan' table
ALTER TABLE waktu
ADD CONSTRAINT fk_transaksi_waktu
FOREIGN KEY(transaksi_id)
REFERENCES transaksi_penjualan;

-- Add a foreign key constraint to the 'lokasi' table
-- The 'transaksi_id' in 'lokasi' references the 'transaksi_id' in the 'transaksi_penjualan' table
ALTER TABLE lokasi
ADD CONSTRAINT fk_transaksi_lokasi
FOREIGN KEY(transaksi_id)
REFERENCES transaksi_penjualan;