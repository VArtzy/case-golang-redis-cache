-- Insert 10 Parent Categories
INSERT INTO categories (id, name, parent_id) VALUES
                                                 ('electronics', 'Electronics', NULL),
                                                 ('fashion', 'Fashion & Clothing', NULL),
                                                 ('home-garden', 'Home & Garden', NULL),
                                                 ('sports', 'Sports & Outdoor', NULL),
                                                 ('automotive', 'Automotive', NULL),
                                                 ('books', 'Books & Media', NULL),
                                                 ('health-beauty', 'Health & Beauty', NULL),
                                                 ('toys-games', 'Toys & Games', NULL),
                                                 ('food-beverage', 'Food & Beverage', NULL),
                                                 ('travel', 'Travel & Tourism', NULL);

-- Insert Child Categories for Electronics
INSERT INTO categories (id, name, parent_id) VALUES
                                                 ('smartphones', 'Smartphones', 'electronics'),
                                                 ('laptops', 'Laptops', 'electronics'),
                                                 ('tablets', 'Tablets', 'electronics'),
                                                 ('headphones', 'Headphones', 'electronics'),
                                                 ('cameras', 'Cameras', 'electronics'),
                                                 ('gaming-consoles', 'Gaming Consoles', 'electronics'),
                                                 ('smart-watch', 'Smart Watches', 'electronics'),
                                                 ('tv-monitors', 'TV & Monitors', 'electronics'),
                                                 ('audio-speakers', 'Audio & Speakers', 'electronics'),
                                                 ('accessories-electronic', 'Electronic Accessories', 'electronics');

-- Insert Child Categories for Fashion & Clothing
INSERT INTO categories (id, name, parent_id) VALUES
                                                 ('mens-clothing', 'Men\'s Clothing', 'fashion'),
('womens-clothing', 'Women\'s Clothing', 'fashion'),
                                                 ('shoes', 'Shoes', 'fashion'),
                                                 ('bags-luggage', 'Bags & Luggage', 'fashion'),
                                                 ('jewelry', 'Jewelry', 'fashion'),
                                                 ('watches', 'Watches', 'fashion'),
                                                 ('sunglasses', 'Sunglasses', 'fashion'),
                                                 ('kids-clothing', 'Kids Clothing', 'fashion'),
                                                 ('underwear', 'Underwear & Lingerie', 'fashion'),
                                                 ('fashion-accessories', 'Fashion Accessories', 'fashion');

-- Insert Child Categories for Home & Garden
INSERT INTO categories (id, name, parent_id) VALUES
                                                 ('furniture', 'Furniture', 'home-garden'),
                                                 ('kitchen-appliances', 'Kitchen Appliances', 'home-garden'),
                                                 ('home-decor', 'Home Decor', 'home-garden'),
                                                 ('bedding', 'Bedding & Bath', 'home-garden'),
                                                 ('lighting', 'Lighting', 'home-garden'),
                                                 ('garden-tools', 'Garden Tools', 'home-garden'),
                                                 ('plants', 'Plants & Seeds', 'home-garden'),
                                                 ('cleaning-supplies', 'Cleaning Supplies', 'home-garden'),
                                                 ('storage-organization', 'Storage & Organization', 'home-garden'),
                                                 ('home-improvement', 'Home Improvement', 'home-garden');

-- Insert Child Categories for Sports & Outdoor
INSERT INTO categories (id, name, parent_id) VALUES
                                                 ('fitness-equipment', 'Fitness Equipment', 'sports'),
                                                 ('outdoor-gear', 'Outdoor Gear', 'sports'),
                                                 ('sports-apparel', 'Sports Apparel', 'sports'),
                                                 ('cycling', 'Cycling', 'sports'),
                                                 ('water-sports', 'Water Sports', 'sports'),
                                                 ('team-sports', 'Team Sports', 'sports'),
                                                 ('winter-sports', 'Winter Sports', 'sports'),
                                                 ('running', 'Running', 'sports'),
                                                 ('camping', 'Camping & Hiking', 'sports'),
                                                 ('sports-accessories', 'Sports Accessories', 'sports');

-- Insert Child Categories for Automotive
INSERT INTO categories (id, name, parent_id) VALUES
                                                 ('car-parts', 'Car Parts', 'automotive'),
                                                 ('car-accessories', 'Car Accessories', 'automotive'),
                                                 ('motorcycle-parts', 'Motorcycle Parts', 'automotive'),
                                                 ('tires', 'Tires', 'automotive'),
                                                 ('car-electronics', 'Car Electronics', 'automotive'),
                                                 ('tools-equipment', 'Tools & Equipment', 'automotive'),
                                                 ('car-care', 'Car Care & Detailing', 'automotive'),
                                                 ('oils-fluids', 'Oils & Fluids', 'automotive'),
                                                 ('performance-parts', 'Performance Parts', 'automotive'),
                                                 ('safety-security', 'Safety & Security', 'automotive');

-- Insert Child Categories for Books & Media
INSERT INTO categories (id, name, parent_id) VALUES
                                                 ('fiction-books', 'Fiction Books', 'books'),
                                                 ('non-fiction', 'Non-Fiction', 'books'),
                                                 ('textbooks', 'Textbooks', 'books'),
                                                 ('comics-manga', 'Comics & Manga', 'books'),
                                                 ('magazines', 'Magazines', 'books'),
                                                 ('ebooks', 'E-books', 'books'),
                                                 ('audiobooks', 'Audiobooks', 'books'),
                                                 ('music-cds', 'Music CDs', 'books'),
                                                 ('movies-dvd', 'Movies & DVDs', 'books'),
                                                 ('educational-media', 'Educational Media', 'books');

-- Insert Child Categories for Health & Beauty
INSERT INTO categories (id, name, parent_id) VALUES
                                                 ('skincare', 'Skincare', 'health-beauty'),
                                                 ('makeup', 'Makeup', 'health-beauty'),
                                                 ('haircare', 'Hair Care', 'health-beauty'),
                                                 ('fragrances', 'Fragrances', 'health-beauty'),
                                                 ('vitamins-supplements', 'Vitamins & Supplements', 'health-beauty'),
                                                 ('personal-care', 'Personal Care', 'health-beauty'),
                                                 ('medical-supplies', 'Medical Supplies', 'health-beauty'),
                                                 ('fitness-nutrition', 'Fitness & Nutrition', 'health-beauty'),
                                                 ('beauty-tools', 'Beauty Tools', 'health-beauty'),
                                                 ('organic-natural', 'Organic & Natural', 'health-beauty');

-- Insert Child Categories for Toys & Games
INSERT INTO categories (id, name, parent_id) VALUES
                                                 ('action-figures', 'Action Figures', 'toys-games'),
                                                 ('board-games', 'Board Games', 'toys-games'),
                                                 ('video-games', 'Video Games', 'toys-games'),
                                                 ('educational-toys', 'Educational Toys', 'toys-games'),
                                                 ('dolls-stuffed-animals', 'Dolls & Stuffed Animals', 'toys-games'),
                                                 ('building-blocks', 'Building Blocks', 'toys-games'),
                                                 ('remote-control', 'Remote Control Toys', 'toys-games'),
                                                 ('puzzles', 'Puzzles', 'toys-games'),
                                                 ('outdoor-toys', 'Outdoor Toys', 'toys-games'),
                                                 ('craft-art-supplies', 'Craft & Art Supplies', 'toys-games');

-- Insert Child Categories for Food & Beverage
INSERT INTO categories (id, name, parent_id) VALUES
                                                 ('fresh-produce', 'Fresh Produce', 'food-beverage'),
                                                 ('meat-seafood', 'Meat & Seafood', 'food-beverage'),
                                                 ('dairy-products', 'Dairy Products', 'food-beverage'),
                                                 ('beverages', 'Beverages', 'food-beverage'),
                                                 ('snacks-candy', 'Snacks & Candy', 'food-beverage'),
                                                 ('pantry-staples', 'Pantry Staples', 'food-beverage'),
                                                 ('frozen-foods', 'Frozen Foods', 'food-beverage'),
                                                 ('organic-foods', 'Organic Foods', 'food-beverage'),
                                                 ('international-cuisine', 'International Cuisine', 'food-beverage'),
                                                 ('specialty-diet', 'Specialty Diet Foods', 'food-beverage');

-- Insert Child Categories for Travel & Tourism
INSERT INTO categories (id, name, parent_id) VALUES
                                                 ('flight-tickets', 'Flight Tickets', 'travel'),
                                                 ('hotels-accommodation', 'Hotels & Accommodation', 'travel'),
                                                 ('car-rental', 'Car Rental', 'travel'),
                                                 ('travel-packages', 'Travel Packages', 'travel'),
                                                 ('cruise-tours', 'Cruise & Tours', 'travel'),
                                                 ('travel-insurance', 'Travel Insurance', 'travel'),
                                                 ('travel-gear', 'Travel Gear', 'travel'),
                                                 ('visa-services', 'Visa Services', 'travel'),
                                                 ('activities-experiences', 'Activities & Experiences', 'travel'),
                                                 ('travel-guides', 'Travel Guides & Maps', 'travel');
