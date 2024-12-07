CREATE TABLE Restaurant(
	RestaurantId SERIAL PRIMARY KEY,
	NameOfRestaurant VARCHAR(30) NOT NULL UNIQUE,
	CityOfRestaurant VARCHAR(30) NOT NULL,
	RestaurantCapacity INT NOT NULL,
	IsDeliveryAvalable BOOLEAN
);
CREATE TABLE Food(
	FoodId SERIAL PRIMARY KEY,
	NameOfFood VARCHAR(30) NOT NULL UNIQUE,
	Category VARCHAR(10) NOT NULL,
	CaloryCount FLOAT NOT NULL
);
ALTER TABLE Food
	ADD CONSTRAINT IsCategoryValid CHECK(Category IN ('Side', 'Main', 'Desert'))
CREATE TABLE Customers(
	CustomerId SERIAL PRIMARY KEY,
	NameOfCustomer VARCHAR(30) NOT NULL,
	SurnameOfCustomer VARCHAR(30) NOT NULL,
	HasLoyaltyCard BOOLEAN
);
CREATE TABLE Employes(
	EmployeId SERIAL PRIMARY KEY,
	NameOfEmploye VARCHAR(30) NOT NULL,
	DateOfBirth TIMESTAMP NOT NULL,
	EmployeDuty VARCHAR(20) NOT NULL,
	HasDriverLicense BOOLEAN,
	RestaurantId INT REFERENCES Restaurant(RestaurantId)
);
ALTER TABLE Employes
	ADD CONSTRAINT Duty CHECK(EmployeDuty IN ('Kitchen','Delivery'))
CREATE TABLE OrderFood(
	OrderId SERIAL PRIMARY KEY,
	OrderCategory VARCHAR(10) NOT NULL,
	DeliveryGuyId INT NOT NULL,
	Adress VARCHAR(30) NOT NULL,
	TimeOfDelivery TIMESTAMP NOT NULL,
	FoodId INT REFERENCES Food(FoodId),
	CustomerId INT REFERENCES Customers(CustomerId),
	RestaurantId INT REFERENCES Restaurant(RestaurantId)
);
ALTER TABLE OrderFood
	ADD CONSTRAINT Category CHECK(OrderCategory IN ('Delivery', 'Inside'))
CREATE TABLE Menu(
	FoodId INT REFERENCES Food(FoodId),
	RestaurantId INT REFERENCES Restaurant(RestaurantId),
	Price INT NOT NULL,
	OrderId INT REFERENCES OrderFood(OrderId),
	PRIMARY KEY(RestaurantId, FoodId)
);
ALTER TABLE Menu
	ADD CONSTRAINT PricePositive CHECK(Price > 0)