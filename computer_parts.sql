CREATE DATABASE pc_builder;

USE pc_builder;

CREATE TABLE products (
  id INT AUTO_INCREMENT PRIMARY KEY,
  name VARCHAR(255) NOT NULL,
  type VARCHAR(50) NOT NULL,
  price DECIMAL(10, 2) NOT NULL,
  description TEXT NOT NULL
);

INSERT INTO products (name, type, price, description) VALUES
-- CPU
('CPU - Budget', 'cpu', 3000.00, 'Intel Core i3, 4 cores, suitable for basic tasks and everyday computing.'),
('CPU - Mid-range', 'cpu', 7000.00, 'Intel Core i5, 6 cores, ideal for gaming and multitasking.'),
('CPU - High-end', 'cpu', 15000.00, 'Intel Core i9, 12 cores, perfect for demanding applications and high-end gaming.'),

-- GPU
('GPU - Budget', 'gpu', 8000.00, 'NVIDIA GTX 1050 Ti, 4GB VRAM, suitable for light gaming and graphics work.'),
('GPU - Mid-range', 'gpu', 20000.00, 'NVIDIA RTX 3060, 12GB VRAM, excellent for smooth gaming and rendering.'),
('GPU - High-end', 'gpu', 50000.00, 'NVIDIA RTX 4090, 24GB VRAM, for the best gaming experience and professional work.'),

-- RAM
('RAM - Budget', 'ram', 2000.00, '8GB DDR4 2400MHz, suitable for basic tasks.'),
('RAM - Mid-range', 'ram', 8000.00, '16GB DDR4 3200MHz, ideal for multitasking and gaming.'),
('RAM - High-end', 'ram', 15000.00, '32GB DDR4 3600MHz, high-performance RAM for heavy multitasking and content creation.'),

-- Storage
('Storage - Budget', 'storage', 1500.00, '256GB SATA SSD, fast boot times and file access for basic needs.'),
('Storage - Mid-range', 'storage', 3000.00, '512GB NVMe SSD, faster performance and more storage for general use.'),
('Storage - High-end', 'storage', 8000.00, '1TB NVMe SSD, maximum performance and storage space for high-end use.'),

-- Cooler
('Cooler - Budget', 'cooler', 800.00, 'Basic air cooler, suitable for low-power CPUs.'),
('Cooler - Mid-range', 'cooler', 3000.00, 'Mid-range air cooler, better cooling performance for gaming setups.'),
('Cooler - High-end', 'cooler', 8000.00, 'High-end liquid cooler, top-tier cooling performance for overclocked CPUs.'),

-- Motherboard
('Motherboard - Budget', 'motherboard', 5000.00, 'Micro-ATX motherboard, basic features, suitable for budget builds.'),
('Motherboard - Mid-range', 'motherboard', 10000.00, 'ATX motherboard, reliable performance with extra features.'),
('Motherboard - High-end', 'motherboard', 20000.00, 'ATX motherboard with advanced features and support for overclocking.'),

-- Power Supply
('Power Supply - Budget', 'psu', 3000.00, '450W PSU, sufficient for basic builds.'),
('Power Supply - Mid-range', 'psu', 6000.00, '650W PSU, reliable power for mid-range systems.'),
('Power Supply - High-end', 'psu', 12000.00, '850W PSU, high efficiency and power for high-end builds.'),

-- Case
('Case - Budget', 'case', 2000.00, 'Basic ATX case, simple design for budget builds.'),
('Case - Mid-range', 'case', 5000.00, 'ATX case with better airflow and additional features.'),
('Case - High-end', 'case', 10000.00, 'Premium ATX case with advanced cooling options and build quality.'),

-- Monitor
('Monitor - Budget', 'monitor', 8000.00, '24" 1080p monitor, suitable for everyday use.'),
('Monitor - Mid-range', 'monitor', 15000.00, '27" 1440p monitor, ideal for gaming and professional work.'),
('Monitor - High-end', 'monitor', 30000.00, '32" 4K monitor, top-tier resolution and features for high-end use.'),

-- Keyboard
('Keyboard - Budget', 'keyboard', 1000.00, 'Basic membrane keyboard for everyday typing needs.'),
('Keyboard - Mid-range', 'keyboard', 3000.00, 'Mechanical keyboard with RGB lighting, better build quality and features.'),
('Keyboard - High-end', 'keyboard', 8000.00, 'Premium mechanical keyboard with customizable keys and top-tier performance.'),

-- Mouse
('Mouse - Budget', 'mouse', 800.00, 'Basic optical mouse for general use.'),
('Mouse - Mid-range', 'mouse', 2000.00, 'Gaming mouse with adjustable DPI and additional buttons.'),
('Mouse - High-end', 'mouse', 5000.00, 'High-end gaming mouse with advanced features and precision.');
