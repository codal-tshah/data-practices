create schema nifty_schema;


drop table nifty_schema.NIFTY_AUTO;
CREATE table if not exists nifty_schema.NIFTY_AUTO(
	Symbol VARCHAR(32) NOT null,
	Dates DATE NOT null,
	Open_price DECIMAL(10, 2) NOT null,
	High_price DECIMAL(10, 2) NOT null,
	Low_price	DECIMAL(10, 2) NOT null,
	Close_price DECIMAL(10, 2) NOT null,
	Shares_traded INT not null,
	Turnover_in_cr DECIMAL(10, 2) NOT null
)
SORTKEY(Dates);

drop table nifty_schema.NIFTY_BANK;
CREATE table if not exists nifty_schema.NIFTY_BANK(
	Symbol VARCHAR(32) NOT null,
	Dates DATE NOT null,
	Open_price DECIMAL(10, 2) NOT null,
	High_price DECIMAL(10, 2) NOT null,
	Low_price	DECIMAL(10, 2) NOT null,
	Close_price DECIMAL(10, 2) NOT null,
	Shares_traded INT not null,
	Turnover_in_cr DECIMAL(10, 2) NOT null
);

drop table nifty_schema.NIFTY_CONSUMER_DURABLES;
CREATE table if not exists nifty_schema.NIFTY_CONSUMER_DURABLES(
	Symbol VARCHAR(32) NOT null,
	Dates DATE NOT null,
	Open_price DECIMAL(10, 2) NOT null,
	High_price DECIMAL(10, 2) NOT null,
	Low_price	DECIMAL(10, 2) NOT null,
	Close_price DECIMAL(10, 2) NOT null,
	Shares_traded INT not null,
	Turnover_in_cr DECIMAL(10, 2) NOT null
);


drop table nifty_schema.NIFTY_ENERGY;
CREATE table if not exists nifty_schema.NIFTY_ENERGY(
	Symbol VARCHAR(32) NOT null,
	Dates DATE NOT null,
	Open_price DECIMAL(10, 2) NOT null,
	High_price DECIMAL(10, 2) NOT null,
	Low_price	DECIMAL(10, 2) NOT null,
	Close_price DECIMAL(10, 2) NOT null,
	Shares_traded INT not null,
	Turnover_in_cr DECIMAL(10, 2) NOT null
);


drop table nifty_schema.NIFTY_FINANCIAL_SERVICES;
CREATE table if not exists nifty_schema.NIFTY_FINANCIAL_SERVICES(
	Symbol VARCHAR(32) NOT null,
	Dates DATE NOT null,
	Open_price DECIMAL(10, 2) NOT null,
	High_price DECIMAL(10, 2) NOT null,
	Low_price	DECIMAL(10, 2) NOT null,
	Close_price DECIMAL(10, 2) NOT null,
	Shares_traded INT not null,
	Turnover_in_cr DECIMAL(10, 2) NOT null
);


drop table nifty_schema.NIFTY_FMCG;
CREATE table if not exists nifty_schema.NIFTY_FMCG(
	Symbol VARCHAR(32) NOT null,
	Dates DATE NOT null,
	Open_price DECIMAL(10, 2) NOT null,
	High_price DECIMAL(10, 2) NOT null,
	Low_price	DECIMAL(10, 2) NOT null,
	Close_price DECIMAL(10, 2) NOT null,
	Shares_traded INT not null,
	Turnover_in_cr DECIMAL(10, 2) NOT null
);



drop table nifty_schema.NIFTY_HEALTHCARE_INDEX;
CREATE table if not exists nifty_schema.NIFTY_HEALTHCARE_INDEX(
	Symbol VARCHAR(32) NOT null,
	Dates DATE NOT null,
	Open_price DECIMAL(10, 2) NOT null,
	High_price DECIMAL(10, 2) NOT null,
	Low_price	DECIMAL(10, 2) NOT null,
	Close_price DECIMAL(10, 2) NOT null,
	Shares_traded INT not null,
	Turnover_in_cr DECIMAL(10, 2) NOT null
);


drop table nifty_schema.NIFTY_IT;
CREATE table if not exists nifty_schema.NIFTY_IT(
	Symbol VARCHAR(32) NOT null,
	Dates DATE NOT null,
	Open_price DECIMAL(10, 2) NOT null,
	High_price DECIMAL(10, 2) NOT null,
	Low_price	DECIMAL(10, 2) NOT null,
	Close_price DECIMAL(10, 2) NOT null,
	Shares_traded INT not null,
	Turnover_in_cr DECIMAL(10, 2) NOT null
);


drop table nifty_schema.NIFTY_MEDIA;
CREATE table if not exists nifty_schema.NIFTY_MEDIA(
	Symbol VARCHAR(32) NOT null,
	Dates DATE NOT null,
	Open_price DECIMAL(10, 2) NOT null,
	High_price DECIMAL(10, 2) NOT null,
	Low_price	DECIMAL(10, 2) NOT null,
	Close_price DECIMAL(10, 2) NOT null,
	Shares_traded INT not null,
	Turnover_in_cr DECIMAL(10, 2) NOT null
);


drop table nifty_schema.NIFTY_METAL;
CREATE table if not exists nifty_schema.NIFTY_METAL(
	Symbol VARCHAR(32) NOT null,
	Dates DATE NOT null,
	Open_price DECIMAL(10, 2) NOT null,
	High_price DECIMAL(10, 2) NOT null,
	Low_price	DECIMAL(10, 2) NOT null,
	Close_price DECIMAL(10, 2) NOT null,
	Shares_traded INT not null,
	Turnover_in_cr DECIMAL(10, 2) NOT null
);


drop table nifty_schema.NIFTY_OIL_AND_GAS;
CREATE table if not exists nifty_schema.NIFTY_OIL_AND_GAS(
	Symbol VARCHAR(32) NOT null,
	Dates DATE NOT null,
	Open_price DECIMAL(10, 2) NOT null,
	High_price DECIMAL(10, 2) NOT null,
	Low_price	DECIMAL(10, 2) NOT null,
	Close_price DECIMAL(10, 2) NOT null,
	Shares_traded INT not null,
	Turnover_in_cr DECIMAL(10, 2) NOT null
);


drop table nifty_schema.NIFTY_PHARMA;
CREATE table if not exists nifty_schema.NIFTY_PHARMA(
	Symbol VARCHAR(32) NOT null,
	Dates DATE NOT null,
	Open_price DECIMAL(10, 2) NOT null,
	High_price DECIMAL(10, 2) NOT null,
	Low_price	DECIMAL(10, 2) NOT null,
	Close_price DECIMAL(10, 2) NOT null,
	Shares_traded INT not null,
	Turnover_in_cr DECIMAL(10, 2) NOT null
);


drop table nifty_schema.NIFTY_PRIVATE_BANK;
CREATE table if not exists nifty_schema.NIFTY_PRIVATE_BANK(
	Symbol VARCHAR(32) NOT null,
	Dates DATE NOT null,
	Open_price DECIMAL(10, 2) NOT null,
	High_price DECIMAL(10, 2) NOT null,
	Low_price	DECIMAL(10, 2) NOT null,
	Close_price DECIMAL(10, 2) NOT null,
	Shares_traded INT not null,
	Turnover_in_cr DECIMAL(10, 2) NOT null
);


drop table nifty_schema.NIFTY_PSU_BANK;
CREATE table if not exists nifty_schema.NIFTY_PSU_BANK(
	Symbol VARCHAR(32) NOT null,
	Dates DATE NOT null,
	Open_price DECIMAL(10, 2) NOT null,
	High_price DECIMAL(10, 2) NOT null,
	Low_price	DECIMAL(10, 2) NOT null,
	Close_price DECIMAL(10, 2) NOT null,
	Shares_traded INT not null,
	Turnover_in_cr DECIMAL(10, 2) NOT null
);


drop table nifty_schema.NIFTY_REALTY;
CREATE table if not exists nifty_schema.NIFTY_REALTY(
	Symbol VARCHAR(32) NOT null,
	Dates DATE NOT null,
	Open_price DECIMAL(10, 2) NOT null,
	High_price DECIMAL(10, 2) NOT null,
	Low_price	DECIMAL(10, 2) NOT null,
	Close_price DECIMAL(10, 2) NOT null,
	Shares_traded INT not null,
	Turnover_in_cr DECIMAL(10, 2) NOT null
);




select * from nifty_schema.NIFTY_AUTO;
select * from nifty_schema.NIFTY_REALTY;
select * from nifty_schema.NIFTY_AUTO;
select *from nifty_schema.nifty_fmcg;



copy nifty_schema.nifty_auto
from 's3://becketfortrial/nifty_cleaned_data/NIFTY_AUTO'
IAM_ROLE default
FORMAT as csv
IGNOREHEADER 1;

copy nifty_schema.nifty_energy
from 's3://becketfortrial/nifty_cleaned_data/NIFTY_ENERGY'
IAM_ROLE default
FORMAT as csv
IGNOREHEADER 1;

copy nifty_schema.nifty_bank
from 's3://becketfortrial/nifty_cleaned_data/NIFTY_BANK'
IAM_ROLE default
FORMAT as csv
IGNOREHEADER 1;

copy nifty_schema.nifty_consumer_durables
from 's3://becketfortrial/nifty_cleaned_data/NIFTY_CONSUMER_DURABLES'
IAM_ROLE default
FORMAT as csv
IGNOREHEADER 1;

copy nifty_schema.nifty_financial_services
from 's3://becketfortrial/nifty_cleaned_data/NIFTY_FINANCIAL_SERVICE'
IAM_ROLE default
FORMAT as csv
IGNOREHEADER 1;


copy nifty_schema.nifty_healthcare_index
from 's3://becketfortrial/nifty_cleaned_data/NIFTY_HEATLHCARE_INDEX'
IAM_ROLE default
FORMAT as csv
IGNOREHEADER 1;


copy nifty_schema.nifty_it
from 's3://becketfortrial/nifty_cleaned_data/NIFTY_IT'
IAM_ROLE default
FORMAT as csv
IGNOREHEADER 1;

copy nifty_schema.nifty_media
from 's3://becketfortrial/nifty_cleaned_data/NIFTY_MEDIA'
IAM_ROLE default
FORMAT as csv
IGNOREHEADER 1;

copy nifty_schema.nifty_metal
from 's3://becketfortrial/nifty_cleaned_data/NIFTY_METAL'
IAM_ROLE default
FORMAT as csv
IGNOREHEADER 1;

copy nifty_schema.nifty_oil_and_gas
from 's3://becketfortrial/nifty_cleaned_data/NIFTY_OIL_AND_GAS'
IAM_ROLE default
FORMAT as csv
IGNOREHEADER 1;

copy nifty_schema.nifty_pharma
from 's3://becketfortrial/nifty_cleaned_data/NIFTY_PHARMA'
IAM_ROLE default
FORMAT as csv
IGNOREHEADER 1;


copy nifty_schema.nifty_private_bank
from 's3://becketfortrial/nifty_cleaned_data/NIFTY_PRIVATE_BANK'
IAM_ROLE default
FORMAT as csv
IGNOREHEADER 1;

copy nifty_schema.nifty_psu_bank
from 's3://becketfortrial/nifty_cleaned_data/NIFTY_PSU_BANK'
IAM_ROLE default
FORMAT as csv
IGNOREHEADER 1;

copy nifty_schema.nifty_realty
from 's3://becketfortrial/nifty_cleaned_data/NIFTY_REALTY'
IAM_ROLE default
FORMAT as csv
IGNOREHEADER 1;




































--copy public.order_items 
--from 's3://becketfortrial/udemy/order_items'
--IAM_ROLE default   --'arn:aws:iam::905418442130:user/tshah' 
--FORMAT as csv
--IGNOREHEADER 1;

#composite key primary key

