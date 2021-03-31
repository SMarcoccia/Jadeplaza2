create table advert (ADVERTID integer not null auto_increment, NAME varchar(255), DISPLAYORDER integer, primary key (ADVERTID)) engine=InnoDB
create table agency (AGENCYID integer not null auto_increment, NAME varchar(255), primary key (AGENCYID)) engine=InnoDB
create table caller_type (CALLERTYPEID integer not null auto_increment, NAME varchar(255), DISPLAYORDER integer, primary key (CALLERTYPEID)) engine=InnoDB
create table person (PERSONID integer not null auto_increment, CREATEDON datetime(6), WEBACCOUNTCREATIONDATE datetime(6), WEBLASTVISIT datetime(6), EMAIL varchar(255), ACTIVERECORD bit, DELETED bit, INITIALS varchar(255) not null, WEBACCOUNTNAME varchar(255), WEBACCOUNTPASSWORD varchar(255), NBOFLOGIN integer, LASTNAME varchar(255), FIRSTNAME varchar(255), primary key (PERSONID)) engine=InnoDB
create table phone_call (PHONECALLID integer not null auto_increment, COLOURCODE varchar(255) not null, POSTCODE varchar(5) not null, RECEIVEDON datetime(6), EMAIL varchar(255) not null, ACKNOWLEDGED bit, DELETED bit, COMPLETE bit, ADDRESSLINE1 varchar(255) not null, MOBILENUMBER varchar(255) not null, LASTNAME varchar(255) not null, MANDATENAME varchar(255) not null, OBJECT longtext not null, FIRSTNAME varchar(255) not null, FOLLOWUP longtext, PHONENUMBER varchar(255), CALLTYPE varchar(255) not null, TOWN varchar(255) not null, AGENCYID integer not null, ADVERTID integer, APPROVEDBY integer, NEGOCIATOR integer, SOURCEID integer, RECEIVEDBY integer not null, FOLLOWEDBY integer, FOLLOWEDBY2 integer, FOLLOWEDBY3 integer, CALLERTYPEID integer not null, primary key (PHONECALLID)) engine=InnoDB
create table source (SOURCEID integer not null auto_increment, NAME varchar(255), DISPLAYORDER integer, primary key (SOURCEID)) engine=InnoDB
alter table person add constraint UK_jnmhkxs5tdukd3cpw93aop3vr unique (EMAIL)
alter table phone_call add constraint UK_b4im4hxwcn3mv2d5yhuld6sf6 unique (EMAIL)
alter table phone_call add constraint FK9ya9u2rigmpcsyk5es4lkm2mp foreign key (AGENCYID) references agency (AGENCYID)
alter table phone_call add constraint FK8na4ciydmxlw62ywiv08m9qfj foreign key (ADVERTID) references advert (ADVERTID)
alter table phone_call add constraint FKp1rwytv5b48icku06ypcemso3 foreign key (APPROVEDBY) references person (PERSONID)
alter table phone_call add constraint FKgi6h6i88i02wdw5ry7pbk28o5 foreign key (NEGOCIATOR) references person (PERSONID)
alter table phone_call add constraint FKp9lf1j7n49pqv9ie08tnhn7h1 foreign key (SOURCEID) references source (SOURCEID)
alter table phone_call add constraint FKnixnm4ik6rh83uqe1vu0osrr8 foreign key (RECEIVEDBY) references person (PERSONID)
alter table phone_call add constraint FK154cyobibs1wbmfpaj4y25wc9 foreign key (FOLLOWEDBY) references person (PERSONID)
alter table phone_call add constraint FKlt1bqtnsejywtr1wrbfa0vogi foreign key (FOLLOWEDBY2) references person (PERSONID)
alter table phone_call add constraint FK7f427a791ehxrmcj6of898oxd foreign key (FOLLOWEDBY3) references person (PERSONID)
alter table phone_call add constraint FK8kirfcxapvdpnrsfedorandrj foreign key (CALLERTYPEID) references caller_type (CALLERTYPEID)
create table advert (ADVERTID integer not null auto_increment, NAME varchar(255), DISPLAYORDER integer, primary key (ADVERTID)) engine=InnoDB
create table agency (AGENCYID integer not null auto_increment, NAME varchar(255), primary key (AGENCYID)) engine=InnoDB
create table caller_type (CALLERTYPEID integer not null auto_increment, NAME varchar(255), DISPLAYORDER integer, primary key (CALLERTYPEID)) engine=InnoDB
create table person (PERSONID integer not null auto_increment, CREATEDON datetime(6), WEBACCOUNTCREATIONDATE datetime(6), WEBLASTVISIT datetime(6), EMAIL varchar(255), ACTIVERECORD bit, DELETED bit, INITIALS varchar(255) not null, WEBACCOUNTNAME varchar(255), WEBACCOUNTPASSWORD varchar(255), NBOFLOGIN integer, LASTNAME varchar(255), FIRSTNAME varchar(255), primary key (PERSONID)) engine=InnoDB
create table phone_call (PHONECALLID integer not null auto_increment, COLOURCODE varchar(255) not null, POSTCODE varchar(5) not null, RECEIVEDON datetime(6), EMAIL varchar(255) not null, ACKNOWLEDGED bit, DELETED bit, COMPLETE bit, ADDRESSLINE1 varchar(255) not null, MOBILENUMBER varchar(255) not null, LASTNAME varchar(255) not null, MANDATENAME varchar(255) not null, OBJECT longtext not null, FIRSTNAME varchar(255) not null, FOLLOWUP longtext, PHONENUMBER varchar(255), CALLTYPE varchar(255) not null, TOWN varchar(255) not null, AGENCYID integer not null, ADVERTID integer, APPROVEDBY integer, NEGOCIATOR integer, SOURCEID integer, RECEIVEDBY integer not null, FOLLOWEDBY integer, FOLLOWEDBY2 integer, FOLLOWEDBY3 integer, CALLERTYPEID integer not null, primary key (PHONECALLID)) engine=InnoDB
create table source (SOURCEID integer not null auto_increment, NAME varchar(255), DISPLAYORDER integer, primary key (SOURCEID)) engine=InnoDB
alter table person add constraint UK_jnmhkxs5tdukd3cpw93aop3vr unique (EMAIL)
alter table phone_call add constraint UK_b4im4hxwcn3mv2d5yhuld6sf6 unique (EMAIL)
alter table phone_call add constraint FK9ya9u2rigmpcsyk5es4lkm2mp foreign key (AGENCYID) references agency (AGENCYID)
alter table phone_call add constraint FK8na4ciydmxlw62ywiv08m9qfj foreign key (ADVERTID) references advert (ADVERTID)
alter table phone_call add constraint FKp1rwytv5b48icku06ypcemso3 foreign key (APPROVEDBY) references person (PERSONID)
alter table phone_call add constraint FKgi6h6i88i02wdw5ry7pbk28o5 foreign key (NEGOCIATOR) references person (PERSONID)
alter table phone_call add constraint FKp9lf1j7n49pqv9ie08tnhn7h1 foreign key (SOURCEID) references source (SOURCEID)
alter table phone_call add constraint FKnixnm4ik6rh83uqe1vu0osrr8 foreign key (RECEIVEDBY) references person (PERSONID)
alter table phone_call add constraint FK154cyobibs1wbmfpaj4y25wc9 foreign key (FOLLOWEDBY) references person (PERSONID)
alter table phone_call add constraint FKlt1bqtnsejywtr1wrbfa0vogi foreign key (FOLLOWEDBY2) references person (PERSONID)
alter table phone_call add constraint FK7f427a791ehxrmcj6of898oxd foreign key (FOLLOWEDBY3) references person (PERSONID)
alter table phone_call add constraint FK8kirfcxapvdpnrsfedorandrj foreign key (CALLERTYPEID) references caller_type (CALLERTYPEID)
create table advert (ADVERTID integer not null auto_increment, NAME varchar(255), DISPLAYORDER integer, primary key (ADVERTID)) engine=InnoDB
create table agency (AGENCYID integer not null auto_increment, NAME varchar(255), primary key (AGENCYID)) engine=InnoDB
create table caller_type (CALLERTYPEID integer not null auto_increment, NAME varchar(255), DISPLAYORDER integer, primary key (CALLERTYPEID)) engine=InnoDB
create table person (PERSONID integer not null auto_increment, CREATEDON datetime(6), WEBACCOUNTCREATIONDATE datetime(6), WEBLASTVISIT datetime(6), EMAIL varchar(255), ACTIVERECORD bit, DELETED bit, INITIALS varchar(255) not null, WEBACCOUNTNAME varchar(255), WEBACCOUNTPASSWORD varchar(255), NBOFLOGIN integer, LASTNAME varchar(255), FIRSTNAME varchar(255), primary key (PERSONID)) engine=InnoDB
create table phone_call (PHONECALLID integer not null auto_increment, COLOURCODE varchar(255) not null, POSTCODE varchar(5) not null, RECEIVEDON datetime(6), EMAIL varchar(255) not null, ACKNOWLEDGED bit, DELETED bit, COMPLETE bit, ADDRESSLINE1 varchar(255) not null, MOBILENUMBER varchar(255) not null, LASTNAME varchar(255) not null, MANDATENAME varchar(255) not null, OBJECT longtext not null, FIRSTNAME varchar(255) not null, FOLLOWUP longtext, PHONENUMBER varchar(255), CALLTYPE varchar(255) not null, TOWN varchar(255) not null, AGENCYID integer not null, ADVERTID integer, APPROVEDBY integer, NEGOCIATOR integer, SOURCEID integer, RECEIVEDBY integer not null, FOLLOWEDBY integer, FOLLOWEDBY2 integer, FOLLOWEDBY3 integer, CALLERTYPEID integer not null, primary key (PHONECALLID)) engine=InnoDB
create table source (SOURCEID integer not null auto_increment, NAME varchar(255), DISPLAYORDER integer, primary key (SOURCEID)) engine=InnoDB
alter table person add constraint UK_jnmhkxs5tdukd3cpw93aop3vr unique (EMAIL)
alter table phone_call add constraint UK_b4im4hxwcn3mv2d5yhuld6sf6 unique (EMAIL)
alter table phone_call add constraint FK9ya9u2rigmpcsyk5es4lkm2mp foreign key (AGENCYID) references agency (AGENCYID)
alter table phone_call add constraint FK8na4ciydmxlw62ywiv08m9qfj foreign key (ADVERTID) references advert (ADVERTID)
alter table phone_call add constraint FKp1rwytv5b48icku06ypcemso3 foreign key (APPROVEDBY) references person (PERSONID)
alter table phone_call add constraint FKgi6h6i88i02wdw5ry7pbk28o5 foreign key (NEGOCIATOR) references person (PERSONID)
alter table phone_call add constraint FKp9lf1j7n49pqv9ie08tnhn7h1 foreign key (SOURCEID) references source (SOURCEID)
alter table phone_call add constraint FKnixnm4ik6rh83uqe1vu0osrr8 foreign key (RECEIVEDBY) references person (PERSONID)
alter table phone_call add constraint FK154cyobibs1wbmfpaj4y25wc9 foreign key (FOLLOWEDBY) references person (PERSONID)
alter table phone_call add constraint FKlt1bqtnsejywtr1wrbfa0vogi foreign key (FOLLOWEDBY2) references person (PERSONID)
alter table phone_call add constraint FK7f427a791ehxrmcj6of898oxd foreign key (FOLLOWEDBY3) references person (PERSONID)
alter table phone_call add constraint FK8kirfcxapvdpnrsfedorandrj foreign key (CALLERTYPEID) references caller_type (CALLERTYPEID)
create table advert (ADVERTID integer not null auto_increment, NAME varchar(255), DISPLAYORDER integer, primary key (ADVERTID)) engine=InnoDB
create table agency (AGENCYID integer not null auto_increment, NAME varchar(255), primary key (AGENCYID)) engine=InnoDB
create table caller_type (CALLERTYPEID integer not null auto_increment, NAME varchar(255), DISPLAYORDER integer, primary key (CALLERTYPEID)) engine=InnoDB
create table person (PERSONID integer not null auto_increment, CREATEDON datetime(6), WEBACCOUNTCREATIONDATE datetime(6), WEBLASTVISIT datetime(6), EMAIL varchar(255), ACTIVERECORD bit, DELETED bit, INITIALS varchar(255) not null, WEBACCOUNTNAME varchar(255), WEBACCOUNTPASSWORD varchar(255), NBOFLOGIN integer, LASTNAME varchar(255), FIRSTNAME varchar(255), primary key (PERSONID)) engine=InnoDB
create table phone_call (PHONECALLID integer not null auto_increment, COLOURCODE varchar(255) not null, POSTCODE varchar(5) not null, RECEIVEDON datetime(6), EMAIL varchar(255) not null, ACKNOWLEDGED bit, DELETED bit, COMPLETE bit, ADDRESSLINE1 varchar(255) not null, MOBILENUMBER varchar(255) not null, LASTNAME varchar(255) not null, MANDATENAME varchar(255) not null, OBJECT longtext not null, FIRSTNAME varchar(255) not null, FOLLOWUP longtext, PHONENUMBER varchar(255), CALLTYPE varchar(255) not null, TOWN varchar(255) not null, AGENCYID integer not null, ADVERTID integer, APPROVEDBY integer, NEGOCIATOR integer, SOURCEID integer, RECEIVEDBY integer not null, FOLLOWEDBY integer, FOLLOWEDBY2 integer, FOLLOWEDBY3 integer, CALLERTYPEID integer not null, primary key (PHONECALLID)) engine=InnoDB
create table source (SOURCEID integer not null auto_increment, NAME varchar(255), DISPLAYORDER integer, primary key (SOURCEID)) engine=InnoDB
alter table person add constraint UK_jnmhkxs5tdukd3cpw93aop3vr unique (EMAIL)
alter table phone_call add constraint UK_b4im4hxwcn3mv2d5yhuld6sf6 unique (EMAIL)
alter table phone_call add constraint FK9ya9u2rigmpcsyk5es4lkm2mp foreign key (AGENCYID) references agency (AGENCYID)
alter table phone_call add constraint FK8na4ciydmxlw62ywiv08m9qfj foreign key (ADVERTID) references advert (ADVERTID)
alter table phone_call add constraint FKp1rwytv5b48icku06ypcemso3 foreign key (APPROVEDBY) references person (PERSONID)
alter table phone_call add constraint FKgi6h6i88i02wdw5ry7pbk28o5 foreign key (NEGOCIATOR) references person (PERSONID)
alter table phone_call add constraint FKp9lf1j7n49pqv9ie08tnhn7h1 foreign key (SOURCEID) references source (SOURCEID)
alter table phone_call add constraint FKnixnm4ik6rh83uqe1vu0osrr8 foreign key (RECEIVEDBY) references person (PERSONID)
alter table phone_call add constraint FK154cyobibs1wbmfpaj4y25wc9 foreign key (FOLLOWEDBY) references person (PERSONID)
alter table phone_call add constraint FKlt1bqtnsejywtr1wrbfa0vogi foreign key (FOLLOWEDBY2) references person (PERSONID)
alter table phone_call add constraint FK7f427a791ehxrmcj6of898oxd foreign key (FOLLOWEDBY3) references person (PERSONID)
alter table phone_call add constraint FK8kirfcxapvdpnrsfedorandrj foreign key (CALLERTYPEID) references caller_type (CALLERTYPEID)
create table advert (ADVERTID integer not null auto_increment, NAME varchar(255), DISPLAYORDER integer, primary key (ADVERTID)) engine=InnoDB
create table agency (AGENCYID integer not null auto_increment, NAME varchar(255), primary key (AGENCYID)) engine=InnoDB
create table caller_type (CALLERTYPEID integer not null auto_increment, NAME varchar(255), DISPLAYORDER integer, primary key (CALLERTYPEID)) engine=InnoDB
create table person (PERSONID integer not null auto_increment, CREATEDON datetime(6), WEBACCOUNTCREATIONDATE datetime(6), WEBLASTVISIT datetime(6), EMAIL varchar(255), ACTIVERECORD bit, DELETED bit, INITIALS varchar(255) not null, WEBACCOUNTNAME varchar(255), WEBACCOUNTPASSWORD varchar(255), NBOFLOGIN integer, LASTNAME varchar(255), FIRSTNAME varchar(255), primary key (PERSONID)) engine=InnoDB
create table phone_call (PHONECALLID integer not null auto_increment, COLOURCODE varchar(255) not null, POSTCODE varchar(5) not null, RECEIVEDON datetime(6), EMAIL varchar(255) not null, ACKNOWLEDGED bit, DELETED bit, COMPLETE bit, ADDRESSLINE1 varchar(255) not null, MOBILENUMBER varchar(255) not null, LASTNAME varchar(255) not null, MANDATENAME varchar(255) not null, OBJECT longtext not null, FIRSTNAME varchar(255) not null, FOLLOWUP longtext, PHONENUMBER varchar(255), CALLTYPE varchar(255) not null, TOWN varchar(255) not null, AGENCYID integer not null, ADVERTID integer, APPROVEDBY integer, NEGOCIATOR integer, SOURCEID integer, RECEIVEDBY integer not null, FOLLOWEDBY integer, FOLLOWEDBY2 integer, FOLLOWEDBY3 integer, CALLERTYPEID integer not null, primary key (PHONECALLID)) engine=InnoDB
create table source (SOURCEID integer not null auto_increment, NAME varchar(255), DISPLAYORDER integer, primary key (SOURCEID)) engine=InnoDB
alter table person add constraint UK_jnmhkxs5tdukd3cpw93aop3vr unique (EMAIL)
alter table phone_call add constraint UK_b4im4hxwcn3mv2d5yhuld6sf6 unique (EMAIL)
alter table phone_call add constraint FK9ya9u2rigmpcsyk5es4lkm2mp foreign key (AGENCYID) references agency (AGENCYID)
alter table phone_call add constraint FK8na4ciydmxlw62ywiv08m9qfj foreign key (ADVERTID) references advert (ADVERTID)
alter table phone_call add constraint FKp1rwytv5b48icku06ypcemso3 foreign key (APPROVEDBY) references person (PERSONID)
alter table phone_call add constraint FKgi6h6i88i02wdw5ry7pbk28o5 foreign key (NEGOCIATOR) references person (PERSONID)
alter table phone_call add constraint FKp9lf1j7n49pqv9ie08tnhn7h1 foreign key (SOURCEID) references source (SOURCEID)
alter table phone_call add constraint FKnixnm4ik6rh83uqe1vu0osrr8 foreign key (RECEIVEDBY) references person (PERSONID)
alter table phone_call add constraint FK154cyobibs1wbmfpaj4y25wc9 foreign key (FOLLOWEDBY) references person (PERSONID)
alter table phone_call add constraint FKlt1bqtnsejywtr1wrbfa0vogi foreign key (FOLLOWEDBY2) references person (PERSONID)
alter table phone_call add constraint FK7f427a791ehxrmcj6of898oxd foreign key (FOLLOWEDBY3) references person (PERSONID)
alter table phone_call add constraint FK8kirfcxapvdpnrsfedorandrj foreign key (CALLERTYPEID) references caller_type (CALLERTYPEID)
create table advert (ADVERTID integer not null auto_increment, NAME varchar(255), DISPLAYORDER integer, primary key (ADVERTID)) engine=InnoDB
create table agency (AGENCYID integer not null auto_increment, NAME varchar(255), primary key (AGENCYID)) engine=InnoDB
create table caller_type (CALLERTYPEID integer not null auto_increment, NAME varchar(255), DISPLAYORDER integer, primary key (CALLERTYPEID)) engine=InnoDB
create table person (PERSONID integer not null auto_increment, CREATEDON datetime(6), WEBACCOUNTCREATIONDATE datetime(6), WEBLASTVISIT datetime(6), EMAIL varchar(255), ACTIVERECORD bit, DELETED bit, INITIALS varchar(255) not null, WEBACCOUNTNAME varchar(255), WEBACCOUNTPASSWORD varchar(255), NBOFLOGIN integer, LASTNAME varchar(255), FIRSTNAME varchar(255), primary key (PERSONID)) engine=InnoDB
create table phone_call (PHONECALLID integer not null auto_increment, COLOURCODE varchar(255) not null, POSTCODE varchar(5) not null, RECEIVEDON datetime(6), EMAIL varchar(255) not null, ACKNOWLEDGED bit, DELETED bit, COMPLETE bit, ADDRESSLINE1 varchar(255) not null, MOBILENUMBER varchar(255) not null, LASTNAME varchar(255) not null, MANDATENAME varchar(255) not null, OBJECT longtext not null, FIRSTNAME varchar(255) not null, FOLLOWUP longtext, PHONENUMBER varchar(255), CALLTYPE varchar(255) not null, TOWN varchar(255) not null, AGENCYID integer not null, ADVERTID integer, APPROVEDBY integer, NEGOCIATOR integer, SOURCEID integer, RECEIVEDBY integer not null, FOLLOWEDBY integer, FOLLOWEDBY2 integer, FOLLOWEDBY3 integer, CALLERTYPEID integer not null, primary key (PHONECALLID)) engine=InnoDB
create table source (SOURCEID integer not null auto_increment, NAME varchar(255), DISPLAYORDER integer, primary key (SOURCEID)) engine=InnoDB
alter table person add constraint UK_jnmhkxs5tdukd3cpw93aop3vr unique (EMAIL)
alter table phone_call add constraint UK_b4im4hxwcn3mv2d5yhuld6sf6 unique (EMAIL)
alter table phone_call add constraint FK9ya9u2rigmpcsyk5es4lkm2mp foreign key (AGENCYID) references agency (AGENCYID)
alter table phone_call add constraint FK8na4ciydmxlw62ywiv08m9qfj foreign key (ADVERTID) references advert (ADVERTID)
alter table phone_call add constraint FKp1rwytv5b48icku06ypcemso3 foreign key (APPROVEDBY) references person (PERSONID)
alter table phone_call add constraint FKgi6h6i88i02wdw5ry7pbk28o5 foreign key (NEGOCIATOR) references person (PERSONID)
alter table phone_call add constraint FKp9lf1j7n49pqv9ie08tnhn7h1 foreign key (SOURCEID) references source (SOURCEID)
alter table phone_call add constraint FKnixnm4ik6rh83uqe1vu0osrr8 foreign key (RECEIVEDBY) references person (PERSONID)
alter table phone_call add constraint FK154cyobibs1wbmfpaj4y25wc9 foreign key (FOLLOWEDBY) references person (PERSONID)
alter table phone_call add constraint FKlt1bqtnsejywtr1wrbfa0vogi foreign key (FOLLOWEDBY2) references person (PERSONID)
alter table phone_call add constraint FK7f427a791ehxrmcj6of898oxd foreign key (FOLLOWEDBY3) references person (PERSONID)
alter table phone_call add constraint FK8kirfcxapvdpnrsfedorandrj foreign key (CALLERTYPEID) references caller_type (CALLERTYPEID)
create table advert (ADVERTID integer not null auto_increment, NAME varchar(255), DISPLAYORDER integer, primary key (ADVERTID)) engine=InnoDB
create table agency (AGENCYID integer not null auto_increment, NAME varchar(255), primary key (AGENCYID)) engine=InnoDB
create table caller_type (CALLERTYPEID integer not null auto_increment, NAME varchar(255), DISPLAYORDER integer, primary key (CALLERTYPEID)) engine=InnoDB
create table person (PERSONID integer not null auto_increment, CREATEDON datetime(6), WEBACCOUNTCREATIONDATE datetime(6), WEBLASTVISIT datetime(6), EMAIL varchar(255), ACTIVERECORD bit, DELETED bit, INITIALS varchar(255) not null, WEBACCOUNTNAME varchar(255), WEBACCOUNTPASSWORD varchar(255), NBOFLOGIN integer, LASTNAME varchar(255), FIRSTNAME varchar(255), primary key (PERSONID)) engine=InnoDB
create table phone_call (PHONECALLID integer not null auto_increment, COLOURCODE varchar(255) not null, POSTCODE varchar(5) not null, RECEIVEDON datetime(6), EMAIL varchar(255) not null, ACKNOWLEDGED bit, DELETED bit, COMPLETE bit, ADDRESSLINE1 varchar(255) not null, MOBILENUMBER varchar(255) not null, LASTNAME varchar(255) not null, MANDATENAME varchar(255) not null, OBJECT longtext not null, FIRSTNAME varchar(255) not null, FOLLOWUP longtext, PHONENUMBER varchar(255), CALLTYPE varchar(255) not null, TOWN varchar(255) not null, AGENCYID integer not null, ADVERTID integer, APPROVEDBY integer, NEGOCIATOR integer, SOURCEID integer, RECEIVEDBY integer not null, FOLLOWEDBY integer, FOLLOWEDBY2 integer, FOLLOWEDBY3 integer, CALLERTYPEID integer not null, primary key (PHONECALLID)) engine=InnoDB
create table source (SOURCEID integer not null auto_increment, NAME varchar(255), DISPLAYORDER integer, primary key (SOURCEID)) engine=InnoDB
alter table person add constraint UK_jnmhkxs5tdukd3cpw93aop3vr unique (EMAIL)
alter table phone_call add constraint UK_b4im4hxwcn3mv2d5yhuld6sf6 unique (EMAIL)
alter table phone_call add constraint FK9ya9u2rigmpcsyk5es4lkm2mp foreign key (AGENCYID) references agency (AGENCYID)
alter table phone_call add constraint FK8na4ciydmxlw62ywiv08m9qfj foreign key (ADVERTID) references advert (ADVERTID)
alter table phone_call add constraint FKp1rwytv5b48icku06ypcemso3 foreign key (APPROVEDBY) references person (PERSONID)
alter table phone_call add constraint FKgi6h6i88i02wdw5ry7pbk28o5 foreign key (NEGOCIATOR) references person (PERSONID)
alter table phone_call add constraint FKp9lf1j7n49pqv9ie08tnhn7h1 foreign key (SOURCEID) references source (SOURCEID)
alter table phone_call add constraint FKnixnm4ik6rh83uqe1vu0osrr8 foreign key (RECEIVEDBY) references person (PERSONID)
alter table phone_call add constraint FK154cyobibs1wbmfpaj4y25wc9 foreign key (FOLLOWEDBY) references person (PERSONID)
alter table phone_call add constraint FKlt1bqtnsejywtr1wrbfa0vogi foreign key (FOLLOWEDBY2) references person (PERSONID)
alter table phone_call add constraint FK7f427a791ehxrmcj6of898oxd foreign key (FOLLOWEDBY3) references person (PERSONID)
alter table phone_call add constraint FK8kirfcxapvdpnrsfedorandrj foreign key (CALLERTYPEID) references caller_type (CALLERTYPEID)
create table advert (ADVERTID integer not null auto_increment, NAME varchar(255), DISPLAYORDER integer, primary key (ADVERTID)) engine=InnoDB
create table agency (AGENCYID integer not null auto_increment, NAME varchar(255), primary key (AGENCYID)) engine=InnoDB
create table caller_type (CALLERTYPEID integer not null auto_increment, NAME varchar(255), DISPLAYORDER integer, primary key (CALLERTYPEID)) engine=InnoDB
create table person (PERSONID integer not null auto_increment, CREATEDON datetime(6), WEBACCOUNTCREATIONDATE datetime(6), WEBLASTVISIT datetime(6), EMAIL varchar(255), ACTIVERECORD bit, DELETED bit, INITIALS varchar(255) not null, WEBACCOUNTNAME varchar(255), WEBACCOUNTPASSWORD varchar(255), NBOFLOGIN integer, LASTNAME varchar(255), FIRSTNAME varchar(255), primary key (PERSONID)) engine=InnoDB
create table phone_call (PHONECALLID integer not null auto_increment, COLOURCODE varchar(255) not null, POSTCODE varchar(5) not null, RECEIVEDON datetime(6), EMAIL varchar(255) not null, ACKNOWLEDGED bit, DELETED bit, COMPLETE bit, ADDRESSLINE1 varchar(255) not null, MOBILENUMBER varchar(255) not null, LASTNAME varchar(255) not null, MANDATENAME varchar(255) not null, OBJECT longtext not null, FIRSTNAME varchar(255) not null, FOLLOWUP longtext, PHONENUMBER varchar(255), CALLTYPE varchar(255) not null, TOWN varchar(255) not null, AGENCYID integer not null, ADVERTID integer, APPROVEDBY integer, NEGOCIATOR integer, SOURCEID integer, RECEIVEDBY integer not null, FOLLOWEDBY integer, FOLLOWEDBY2 integer, FOLLOWEDBY3 integer, CALLERTYPEID integer not null, primary key (PHONECALLID)) engine=InnoDB
create table source (SOURCEID integer not null auto_increment, NAME varchar(255), DISPLAYORDER integer, primary key (SOURCEID)) engine=InnoDB
alter table person add constraint UK_jnmhkxs5tdukd3cpw93aop3vr unique (EMAIL)
alter table phone_call add constraint UK_b4im4hxwcn3mv2d5yhuld6sf6 unique (EMAIL)
alter table phone_call add constraint FK9ya9u2rigmpcsyk5es4lkm2mp foreign key (AGENCYID) references agency (AGENCYID)
alter table phone_call add constraint FK8na4ciydmxlw62ywiv08m9qfj foreign key (ADVERTID) references advert (ADVERTID)
alter table phone_call add constraint FKp1rwytv5b48icku06ypcemso3 foreign key (APPROVEDBY) references person (PERSONID)
alter table phone_call add constraint FKgi6h6i88i02wdw5ry7pbk28o5 foreign key (NEGOCIATOR) references person (PERSONID)
alter table phone_call add constraint FKp9lf1j7n49pqv9ie08tnhn7h1 foreign key (SOURCEID) references source (SOURCEID)
alter table phone_call add constraint FKnixnm4ik6rh83uqe1vu0osrr8 foreign key (RECEIVEDBY) references person (PERSONID)
alter table phone_call add constraint FK154cyobibs1wbmfpaj4y25wc9 foreign key (FOLLOWEDBY) references person (PERSONID)
alter table phone_call add constraint FKlt1bqtnsejywtr1wrbfa0vogi foreign key (FOLLOWEDBY2) references person (PERSONID)
alter table phone_call add constraint FK7f427a791ehxrmcj6of898oxd foreign key (FOLLOWEDBY3) references person (PERSONID)
alter table phone_call add constraint FK8kirfcxapvdpnrsfedorandrj foreign key (CALLERTYPEID) references caller_type (CALLERTYPEID)
create table advert (ADVERTID integer not null auto_increment, NAME varchar(255), DISPLAYORDER integer, primary key (ADVERTID)) engine=InnoDB
create table agency (AGENCYID integer not null auto_increment, NAME varchar(255), primary key (AGENCYID)) engine=InnoDB
create table caller_type (CALLERTYPEID integer not null auto_increment, NAME varchar(255), DISPLAYORDER integer, primary key (CALLERTYPEID)) engine=InnoDB
create table person (PERSONID integer not null auto_increment, CREATEDON datetime(6), WEBACCOUNTCREATIONDATE datetime(6), WEBLASTVISIT datetime(6), EMAIL varchar(255), ACTIVERECORD bit, DELETED bit, INITIALS varchar(255) not null, WEBACCOUNTNAME varchar(255), WEBACCOUNTPASSWORD varchar(255), NBOFLOGIN integer, LASTNAME varchar(255), FIRSTNAME varchar(255), primary key (PERSONID)) engine=InnoDB
create table phone_call (PHONECALLID integer not null auto_increment, COLOURCODE varchar(255) not null, POSTCODE varchar(5) not null, RECEIVEDON datetime(6), EMAIL varchar(255) not null, ACKNOWLEDGED bit, DELETED bit, COMPLETE bit, ADDRESSLINE1 varchar(255) not null, MOBILENUMBER varchar(255) not null, LASTNAME varchar(255) not null, MANDATENAME varchar(255) not null, OBJECT longtext not null, FIRSTNAME varchar(255) not null, FOLLOWUP longtext, PHONENUMBER varchar(255), CALLTYPE varchar(255) not null, TOWN varchar(255) not null, AGENCYID integer not null, ADVERTID integer, APPROVEDBY integer, NEGOCIATOR integer, SOURCEID integer, RECEIVEDBY integer not null, FOLLOWEDBY integer, FOLLOWEDBY2 integer, FOLLOWEDBY3 integer, CALLERTYPEID integer not null, primary key (PHONECALLID)) engine=InnoDB
create table source (SOURCEID integer not null auto_increment, NAME varchar(255), DISPLAYORDER integer, primary key (SOURCEID)) engine=InnoDB
alter table person add constraint UK_jnmhkxs5tdukd3cpw93aop3vr unique (EMAIL)
alter table phone_call add constraint UK_b4im4hxwcn3mv2d5yhuld6sf6 unique (EMAIL)
alter table phone_call add constraint FK9ya9u2rigmpcsyk5es4lkm2mp foreign key (AGENCYID) references agency (AGENCYID)
alter table phone_call add constraint FK8na4ciydmxlw62ywiv08m9qfj foreign key (ADVERTID) references advert (ADVERTID)
alter table phone_call add constraint FKp1rwytv5b48icku06ypcemso3 foreign key (APPROVEDBY) references person (PERSONID)
alter table phone_call add constraint FKgi6h6i88i02wdw5ry7pbk28o5 foreign key (NEGOCIATOR) references person (PERSONID)
alter table phone_call add constraint FKp9lf1j7n49pqv9ie08tnhn7h1 foreign key (SOURCEID) references source (SOURCEID)
alter table phone_call add constraint FKnixnm4ik6rh83uqe1vu0osrr8 foreign key (RECEIVEDBY) references person (PERSONID)
alter table phone_call add constraint FK154cyobibs1wbmfpaj4y25wc9 foreign key (FOLLOWEDBY) references person (PERSONID)
alter table phone_call add constraint FKlt1bqtnsejywtr1wrbfa0vogi foreign key (FOLLOWEDBY2) references person (PERSONID)
alter table phone_call add constraint FK7f427a791ehxrmcj6of898oxd foreign key (FOLLOWEDBY3) references person (PERSONID)
alter table phone_call add constraint FK8kirfcxapvdpnrsfedorandrj foreign key (CALLERTYPEID) references caller_type (CALLERTYPEID)
create table advert (ADVERTID integer not null auto_increment, NAME varchar(255), DISPLAYORDER integer, primary key (ADVERTID)) engine=InnoDB
create table agency (AGENCYID integer not null auto_increment, NAME varchar(255), primary key (AGENCYID)) engine=InnoDB
create table caller_type (CALLERTYPEID integer not null auto_increment, NAME varchar(255), DISPLAYORDER integer, primary key (CALLERTYPEID)) engine=InnoDB
create table person (PERSONID integer not null auto_increment, CREATEDON datetime(6), WEBACCOUNTCREATIONDATE datetime(6), WEBLASTVISIT datetime(6), EMAIL varchar(255), ACTIVERECORD bit, DELETED bit, INITIALS varchar(255) not null, WEBACCOUNTNAME varchar(255), WEBACCOUNTPASSWORD varchar(255), NBOFLOGIN integer, LASTNAME varchar(255), FIRSTNAME varchar(255), primary key (PERSONID)) engine=InnoDB
create table phone_call (PHONECALLID integer not null auto_increment, COLOURCODE varchar(255) not null, POSTCODE varchar(5) not null, RECEIVEDON datetime(6), EMAIL varchar(255) not null, ACKNOWLEDGED bit, DELETED bit, COMPLETE bit, ADDRESSLINE1 varchar(255) not null, MOBILENUMBER varchar(255) not null, LASTNAME varchar(255) not null, MANDATENAME varchar(255) not null, OBJECT longtext not null, FIRSTNAME varchar(255) not null, FOLLOWUP longtext, PHONENUMBER varchar(255), CALLTYPE varchar(255) not null, TOWN varchar(255) not null, AGENCYID integer not null, ADVERTID integer, APPROVEDBY integer, NEGOCIATOR integer, SOURCEID integer, RECEIVEDBY integer not null, FOLLOWEDBY integer, FOLLOWEDBY2 integer, FOLLOWEDBY3 integer, CALLERTYPEID integer not null, primary key (PHONECALLID)) engine=InnoDB
create table source (SOURCEID integer not null auto_increment, NAME varchar(255), DISPLAYORDER integer, primary key (SOURCEID)) engine=InnoDB
alter table person add constraint UK_jnmhkxs5tdukd3cpw93aop3vr unique (EMAIL)
alter table phone_call add constraint UK_b4im4hxwcn3mv2d5yhuld6sf6 unique (EMAIL)
alter table phone_call add constraint FK9ya9u2rigmpcsyk5es4lkm2mp foreign key (AGENCYID) references agency (AGENCYID)
alter table phone_call add constraint FK8na4ciydmxlw62ywiv08m9qfj foreign key (ADVERTID) references advert (ADVERTID)
alter table phone_call add constraint FKp1rwytv5b48icku06ypcemso3 foreign key (APPROVEDBY) references person (PERSONID)
alter table phone_call add constraint FKgi6h6i88i02wdw5ry7pbk28o5 foreign key (NEGOCIATOR) references person (PERSONID)
alter table phone_call add constraint FKp9lf1j7n49pqv9ie08tnhn7h1 foreign key (SOURCEID) references source (SOURCEID)
alter table phone_call add constraint FKnixnm4ik6rh83uqe1vu0osrr8 foreign key (RECEIVEDBY) references person (PERSONID)
alter table phone_call add constraint FK154cyobibs1wbmfpaj4y25wc9 foreign key (FOLLOWEDBY) references person (PERSONID)
alter table phone_call add constraint FKlt1bqtnsejywtr1wrbfa0vogi foreign key (FOLLOWEDBY2) references person (PERSONID)
alter table phone_call add constraint FK7f427a791ehxrmcj6of898oxd foreign key (FOLLOWEDBY3) references person (PERSONID)
alter table phone_call add constraint FK8kirfcxapvdpnrsfedorandrj foreign key (CALLERTYPEID) references caller_type (CALLERTYPEID)
create table advert (ADVERTID integer not null auto_increment, NAME varchar(255), DISPLAYORDER integer, primary key (ADVERTID)) engine=InnoDB
create table agency (AGENCYID integer not null auto_increment, NAME varchar(255), primary key (AGENCYID)) engine=InnoDB
create table caller_type (CALLERTYPEID integer not null auto_increment, NAME varchar(255), DISPLAYORDER integer, primary key (CALLERTYPEID)) engine=InnoDB
create table person (PERSONID integer not null auto_increment, CREATEDON datetime(6), WEBACCOUNTCREATIONDATE datetime(6), WEBLASTVISIT datetime(6), EMAIL varchar(255), ACTIVERECORD bit, DELETED bit, INITIALS varchar(255) not null, WEBACCOUNTNAME varchar(255), WEBACCOUNTPASSWORD varchar(255), NBOFLOGIN integer, LASTNAME varchar(255), FIRSTNAME varchar(255), primary key (PERSONID)) engine=InnoDB
create table phone_call (PHONECALLID integer not null auto_increment, COLOURCODE varchar(255) not null, POSTCODE varchar(5) not null, RECEIVEDON datetime(6), EMAIL varchar(255) not null, ACKNOWLEDGED bit, DELETED bit, COMPLETE bit, ADDRESSLINE1 varchar(255) not null, MOBILENUMBER varchar(255) not null, LASTNAME varchar(255) not null, MANDATENAME varchar(255) not null, OBJECT longtext not null, FIRSTNAME varchar(255) not null, FOLLOWUP longtext, PHONENUMBER varchar(255), CALLTYPE varchar(255) not null, TOWN varchar(255) not null, AGENCYID integer not null, ADVERTID integer, APPROVEDBY integer, NEGOCIATOR integer, SOURCEID integer, RECEIVEDBY integer not null, FOLLOWEDBY integer, FOLLOWEDBY2 integer, FOLLOWEDBY3 integer, CALLERTYPEID integer not null, primary key (PHONECALLID)) engine=InnoDB
create table source (SOURCEID integer not null auto_increment, NAME varchar(255), DISPLAYORDER integer, primary key (SOURCEID)) engine=InnoDB
alter table person add constraint UK_jnmhkxs5tdukd3cpw93aop3vr unique (EMAIL)
alter table phone_call add constraint UK_b4im4hxwcn3mv2d5yhuld6sf6 unique (EMAIL)
alter table phone_call add constraint FK9ya9u2rigmpcsyk5es4lkm2mp foreign key (AGENCYID) references agency (AGENCYID)
alter table phone_call add constraint FK8na4ciydmxlw62ywiv08m9qfj foreign key (ADVERTID) references advert (ADVERTID)
alter table phone_call add constraint FKp1rwytv5b48icku06ypcemso3 foreign key (APPROVEDBY) references person (PERSONID)
alter table phone_call add constraint FKgi6h6i88i02wdw5ry7pbk28o5 foreign key (NEGOCIATOR) references person (PERSONID)
alter table phone_call add constraint FKp9lf1j7n49pqv9ie08tnhn7h1 foreign key (SOURCEID) references source (SOURCEID)
alter table phone_call add constraint FKnixnm4ik6rh83uqe1vu0osrr8 foreign key (RECEIVEDBY) references person (PERSONID)
alter table phone_call add constraint FK154cyobibs1wbmfpaj4y25wc9 foreign key (FOLLOWEDBY) references person (PERSONID)
alter table phone_call add constraint FKlt1bqtnsejywtr1wrbfa0vogi foreign key (FOLLOWEDBY2) references person (PERSONID)
alter table phone_call add constraint FK7f427a791ehxrmcj6of898oxd foreign key (FOLLOWEDBY3) references person (PERSONID)
alter table phone_call add constraint FK8kirfcxapvdpnrsfedorandrj foreign key (CALLERTYPEID) references caller_type (CALLERTYPEID)
create table advert (ADVERTID integer not null auto_increment, NAME varchar(255), DISPLAYORDER integer, primary key (ADVERTID)) engine=InnoDB
create table agency (AGENCYID integer not null auto_increment, NAME varchar(255), primary key (AGENCYID)) engine=InnoDB
create table caller_type (CALLERTYPEID integer not null auto_increment, NAME varchar(255), DISPLAYORDER integer, primary key (CALLERTYPEID)) engine=InnoDB
create table person (PERSONID integer not null auto_increment, CREATEDON datetime(6), WEBACCOUNTCREATIONDATE datetime(6), WEBLASTVISIT datetime(6), EMAIL varchar(255), ACTIVERECORD bit, DELETED bit, INITIALS varchar(255) not null, WEBACCOUNTNAME varchar(255), WEBACCOUNTPASSWORD varchar(255), NBOFLOGIN integer, LASTNAME varchar(255), FIRSTNAME varchar(255), primary key (PERSONID)) engine=InnoDB
create table phone_call (PHONECALLID integer not null auto_increment, COLOURCODE varchar(255) not null, POSTCODE varchar(5) not null, RECEIVEDON datetime(6), EMAIL varchar(255) not null, ACKNOWLEDGED bit, DELETED bit, COMPLETE bit, ADDRESSLINE1 varchar(255) not null, MOBILENUMBER varchar(255) not null, LASTNAME varchar(255) not null, MANDATENAME varchar(255) not null, OBJECT longtext not null, FIRSTNAME varchar(255) not null, FOLLOWUP longtext, PHONENUMBER varchar(255), CALLTYPE varchar(255) not null, TOWN varchar(255) not null, AGENCYID integer not null, ADVERTID integer, APPROVEDBY integer, NEGOCIATOR integer, SOURCEID integer, RECEIVEDBY integer not null, FOLLOWEDBY integer, FOLLOWEDBY2 integer, FOLLOWEDBY3 integer, CALLERTYPEID integer not null, primary key (PHONECALLID)) engine=InnoDB
create table source (SOURCEID integer not null auto_increment, NAME varchar(255), DISPLAYORDER integer, primary key (SOURCEID)) engine=InnoDB
alter table person add constraint UK_jnmhkxs5tdukd3cpw93aop3vr unique (EMAIL)
alter table phone_call add constraint UK_b4im4hxwcn3mv2d5yhuld6sf6 unique (EMAIL)
alter table phone_call add constraint FK9ya9u2rigmpcsyk5es4lkm2mp foreign key (AGENCYID) references agency (AGENCYID)
alter table phone_call add constraint FK8na4ciydmxlw62ywiv08m9qfj foreign key (ADVERTID) references advert (ADVERTID)
alter table phone_call add constraint FKp1rwytv5b48icku06ypcemso3 foreign key (APPROVEDBY) references person (PERSONID)
alter table phone_call add constraint FKgi6h6i88i02wdw5ry7pbk28o5 foreign key (NEGOCIATOR) references person (PERSONID)
alter table phone_call add constraint FKp9lf1j7n49pqv9ie08tnhn7h1 foreign key (SOURCEID) references source (SOURCEID)
alter table phone_call add constraint FKnixnm4ik6rh83uqe1vu0osrr8 foreign key (RECEIVEDBY) references person (PERSONID)
alter table phone_call add constraint FK154cyobibs1wbmfpaj4y25wc9 foreign key (FOLLOWEDBY) references person (PERSONID)
alter table phone_call add constraint FKlt1bqtnsejywtr1wrbfa0vogi foreign key (FOLLOWEDBY2) references person (PERSONID)
alter table phone_call add constraint FK7f427a791ehxrmcj6of898oxd foreign key (FOLLOWEDBY3) references person (PERSONID)
alter table phone_call add constraint FK8kirfcxapvdpnrsfedorandrj foreign key (CALLERTYPEID) references caller_type (CALLERTYPEID)
create table advert (ADVERTID integer not null auto_increment, NAME varchar(255), DISPLAYORDER integer, primary key (ADVERTID)) engine=InnoDB
create table agency (AGENCYID integer not null auto_increment, NAME varchar(255), primary key (AGENCYID)) engine=InnoDB
create table caller_type (CALLERTYPEID integer not null auto_increment, NAME varchar(255), DISPLAYORDER integer, primary key (CALLERTYPEID)) engine=InnoDB
create table person (PERSONID integer not null auto_increment, CREATEDON datetime(6), WEBACCOUNTCREATIONDATE datetime(6), WEBLASTVISIT datetime(6), EMAIL varchar(255), ACTIVERECORD bit, DELETED bit, INITIALS varchar(255) not null, WEBACCOUNTNAME varchar(255), WEBACCOUNTPASSWORD varchar(255), NBOFLOGIN integer, LASTNAME varchar(255), FIRSTNAME varchar(255), primary key (PERSONID)) engine=InnoDB
create table phone_call (PHONECALLID integer not null auto_increment, COLOURCODE varchar(255) not null, POSTCODE varchar(5) not null, RECEIVEDON datetime(6), EMAIL varchar(255) not null, ACKNOWLEDGED bit, DELETED bit, COMPLETE bit, ADDRESSLINE1 varchar(255) not null, MOBILENUMBER varchar(255) not null, LASTNAME varchar(255) not null, MANDATENAME varchar(255) not null, OBJECT longtext not null, FIRSTNAME varchar(255) not null, FOLLOWUP longtext, PHONENUMBER varchar(255), CALLTYPE varchar(255) not null, TOWN varchar(255) not null, AGENCYID integer not null, ADVERTID integer, APPROVEDBY integer, NEGOCIATOR integer, SOURCEID integer, RECEIVEDBY integer not null, FOLLOWEDBY integer, FOLLOWEDBY2 integer, FOLLOWEDBY3 integer, CALLERTYPEID integer not null, primary key (PHONECALLID)) engine=InnoDB
create table source (SOURCEID integer not null auto_increment, NAME varchar(255), DISPLAYORDER integer, primary key (SOURCEID)) engine=InnoDB
alter table person add constraint UK_jnmhkxs5tdukd3cpw93aop3vr unique (EMAIL)
alter table phone_call add constraint UK_b4im4hxwcn3mv2d5yhuld6sf6 unique (EMAIL)
alter table phone_call add constraint FK9ya9u2rigmpcsyk5es4lkm2mp foreign key (AGENCYID) references agency (AGENCYID)
alter table phone_call add constraint FK8na4ciydmxlw62ywiv08m9qfj foreign key (ADVERTID) references advert (ADVERTID)
alter table phone_call add constraint FKp1rwytv5b48icku06ypcemso3 foreign key (APPROVEDBY) references person (PERSONID)
alter table phone_call add constraint FKgi6h6i88i02wdw5ry7pbk28o5 foreign key (NEGOCIATOR) references person (PERSONID)
alter table phone_call add constraint FKp9lf1j7n49pqv9ie08tnhn7h1 foreign key (SOURCEID) references source (SOURCEID)
alter table phone_call add constraint FKnixnm4ik6rh83uqe1vu0osrr8 foreign key (RECEIVEDBY) references person (PERSONID)
alter table phone_call add constraint FK154cyobibs1wbmfpaj4y25wc9 foreign key (FOLLOWEDBY) references person (PERSONID)
alter table phone_call add constraint FKlt1bqtnsejywtr1wrbfa0vogi foreign key (FOLLOWEDBY2) references person (PERSONID)
alter table phone_call add constraint FK7f427a791ehxrmcj6of898oxd foreign key (FOLLOWEDBY3) references person (PERSONID)
alter table phone_call add constraint FK8kirfcxapvdpnrsfedorandrj foreign key (CALLERTYPEID) references caller_type (CALLERTYPEID)
create table advert (ADVERTID integer not null auto_increment, NAME varchar(255), DISPLAYORDER integer, primary key (ADVERTID)) engine=InnoDB
create table agency (AGENCYID integer not null auto_increment, NAME varchar(255), primary key (AGENCYID)) engine=InnoDB
create table caller_type (CALLERTYPEID integer not null auto_increment, NAME varchar(255), DISPLAYORDER integer, primary key (CALLERTYPEID)) engine=InnoDB
create table person (PERSONID integer not null auto_increment, CREATEDON datetime(6), WEBACCOUNTCREATIONDATE datetime(6), WEBLASTVISIT datetime(6), EMAIL varchar(255), ACTIVERECORD bit, DELETED bit, INITIALS varchar(255) not null, WEBACCOUNTNAME varchar(255), WEBACCOUNTPASSWORD varchar(255), NBOFLOGIN integer, LASTNAME varchar(255), FIRSTNAME varchar(255), primary key (PERSONID)) engine=InnoDB
create table phone_call (PHONECALLID integer not null auto_increment, COLOURCODE varchar(255) not null, POSTCODE varchar(5) not null, RECEIVEDON datetime(6), EMAIL varchar(255) not null, ACKNOWLEDGED bit, DELETED bit, COMPLETE bit, ADDRESSLINE1 varchar(255) not null, MOBILENUMBER varchar(255) not null, LASTNAME varchar(255) not null, MANDATENAME varchar(255) not null, OBJECT longtext not null, FIRSTNAME varchar(255) not null, FOLLOWUP longtext, PHONENUMBER varchar(255), CALLTYPE varchar(255) not null, TOWN varchar(255) not null, AGENCYID integer not null, ADVERTID integer, APPROVEDBY integer, NEGOCIATOR integer, SOURCEID integer, RECEIVEDBY integer not null, FOLLOWEDBY integer, FOLLOWEDBY2 integer, FOLLOWEDBY3 integer, CALLERTYPEID integer not null, primary key (PHONECALLID)) engine=InnoDB
create table source (SOURCEID integer not null auto_increment, NAME varchar(255), DISPLAYORDER integer, primary key (SOURCEID)) engine=InnoDB
alter table person add constraint UK_jnmhkxs5tdukd3cpw93aop3vr unique (EMAIL)
alter table phone_call add constraint UK_b4im4hxwcn3mv2d5yhuld6sf6 unique (EMAIL)
alter table phone_call add constraint FK9ya9u2rigmpcsyk5es4lkm2mp foreign key (AGENCYID) references agency (AGENCYID)
alter table phone_call add constraint FK8na4ciydmxlw62ywiv08m9qfj foreign key (ADVERTID) references advert (ADVERTID)
alter table phone_call add constraint FKp1rwytv5b48icku06ypcemso3 foreign key (APPROVEDBY) references person (PERSONID)
alter table phone_call add constraint FKgi6h6i88i02wdw5ry7pbk28o5 foreign key (NEGOCIATOR) references person (PERSONID)
alter table phone_call add constraint FKp9lf1j7n49pqv9ie08tnhn7h1 foreign key (SOURCEID) references source (SOURCEID)
alter table phone_call add constraint FKnixnm4ik6rh83uqe1vu0osrr8 foreign key (RECEIVEDBY) references person (PERSONID)
alter table phone_call add constraint FK154cyobibs1wbmfpaj4y25wc9 foreign key (FOLLOWEDBY) references person (PERSONID)
alter table phone_call add constraint FKlt1bqtnsejywtr1wrbfa0vogi foreign key (FOLLOWEDBY2) references person (PERSONID)
alter table phone_call add constraint FK7f427a791ehxrmcj6of898oxd foreign key (FOLLOWEDBY3) references person (PERSONID)
alter table phone_call add constraint FK8kirfcxapvdpnrsfedorandrj foreign key (CALLERTYPEID) references caller_type (CALLERTYPEID)
create table advert (ADVERTID integer not null auto_increment, NAME varchar(255), DISPLAYORDER integer, primary key (ADVERTID)) engine=InnoDB
create table agency (AGENCYID integer not null auto_increment, NAME varchar(255), primary key (AGENCYID)) engine=InnoDB
create table caller_type (CALLERTYPEID integer not null auto_increment, NAME varchar(255), DISPLAYORDER integer, primary key (CALLERTYPEID)) engine=InnoDB
create table person (PERSONID integer not null auto_increment, CREATEDON datetime(6), WEBACCOUNTCREATIONDATE datetime(6), WEBLASTVISIT datetime(6), EMAIL varchar(255), ACTIVERECORD bit, DELETED bit, INITIALS varchar(255) not null, WEBACCOUNTNAME varchar(255), WEBACCOUNTPASSWORD varchar(255), NBOFLOGIN integer, LASTNAME varchar(255), FIRSTNAME varchar(255), primary key (PERSONID)) engine=InnoDB
create table phone_call (PHONECALLID integer not null auto_increment, COLOURCODE varchar(255) not null, POSTCODE varchar(5) not null, RECEIVEDON datetime(6), EMAIL varchar(255) not null, ACKNOWLEDGED bit, DELETED bit, COMPLETE bit, ADDRESSLINE1 varchar(255) not null, MOBILENUMBER varchar(255) not null, LASTNAME varchar(255) not null, MANDATENAME varchar(255) not null, OBJECT longtext not null, FIRSTNAME varchar(255) not null, FOLLOWUP longtext, PHONENUMBER varchar(255), CALLTYPE varchar(255) not null, TOWN varchar(255) not null, AGENCYID integer not null, ADVERTID integer, APPROVEDBY integer, NEGOCIATOR integer, SOURCEID integer, RECEIVEDBY integer not null, FOLLOWEDBY integer, FOLLOWEDBY2 integer, FOLLOWEDBY3 integer, CALLERTYPEID integer not null, primary key (PHONECALLID)) engine=InnoDB
create table source (SOURCEID integer not null auto_increment, NAME varchar(255), DISPLAYORDER integer, primary key (SOURCEID)) engine=InnoDB
alter table person add constraint UK_jnmhkxs5tdukd3cpw93aop3vr unique (EMAIL)
alter table phone_call add constraint UK_b4im4hxwcn3mv2d5yhuld6sf6 unique (EMAIL)
alter table phone_call add constraint FK9ya9u2rigmpcsyk5es4lkm2mp foreign key (AGENCYID) references agency (AGENCYID)
alter table phone_call add constraint FK8na4ciydmxlw62ywiv08m9qfj foreign key (ADVERTID) references advert (ADVERTID)
alter table phone_call add constraint FKp1rwytv5b48icku06ypcemso3 foreign key (APPROVEDBY) references person (PERSONID)
alter table phone_call add constraint FKgi6h6i88i02wdw5ry7pbk28o5 foreign key (NEGOCIATOR) references person (PERSONID)
alter table phone_call add constraint FKp9lf1j7n49pqv9ie08tnhn7h1 foreign key (SOURCEID) references source (SOURCEID)
alter table phone_call add constraint FKnixnm4ik6rh83uqe1vu0osrr8 foreign key (RECEIVEDBY) references person (PERSONID)
alter table phone_call add constraint FK154cyobibs1wbmfpaj4y25wc9 foreign key (FOLLOWEDBY) references person (PERSONID)
alter table phone_call add constraint FKlt1bqtnsejywtr1wrbfa0vogi foreign key (FOLLOWEDBY2) references person (PERSONID)
alter table phone_call add constraint FK7f427a791ehxrmcj6of898oxd foreign key (FOLLOWEDBY3) references person (PERSONID)
alter table phone_call add constraint FK8kirfcxapvdpnrsfedorandrj foreign key (CALLERTYPEID) references caller_type (CALLERTYPEID)
create table advert (ADVERTID integer not null auto_increment, NAME varchar(255), DISPLAYORDER integer, primary key (ADVERTID)) engine=InnoDB
create table agency (AGENCYID integer not null auto_increment, NAME varchar(255), primary key (AGENCYID)) engine=InnoDB
create table caller_type (CALLERTYPEID integer not null auto_increment, NAME varchar(255), DISPLAYORDER integer, primary key (CALLERTYPEID)) engine=InnoDB
create table person (PERSONID integer not null auto_increment, CREATEDON datetime(6), WEBACCOUNTCREATIONDATE datetime(6), WEBLASTVISIT datetime(6), EMAIL varchar(255), ACTIVERECORD bit, DELETED bit, INITIALS varchar(255) not null, WEBACCOUNTNAME varchar(255), WEBACCOUNTPASSWORD varchar(255), NBOFLOGIN integer, LASTNAME varchar(255), FIRSTNAME varchar(255), primary key (PERSONID)) engine=InnoDB
create table phone_call (PHONECALLID integer not null auto_increment, COLOURCODE varchar(255) not null, POSTCODE varchar(5) not null, RECEIVEDON datetime(6), EMAIL varchar(255) not null, ACKNOWLEDGED bit, DELETED bit, COMPLETE bit, ADDRESSLINE1 varchar(255) not null, MOBILENUMBER varchar(255) not null, LASTNAME varchar(255) not null, MANDATENAME varchar(255) not null, OBJECT longtext not null, FIRSTNAME varchar(255) not null, FOLLOWUP longtext, PHONENUMBER varchar(255), CALLTYPE varchar(255) not null, TOWN varchar(255) not null, AGENCYID integer not null, ADVERTID integer, APPROVEDBY integer, NEGOCIATOR integer, SOURCEID integer, RECEIVEDBY integer not null, FOLLOWEDBY integer, FOLLOWEDBY2 integer, FOLLOWEDBY3 integer, CALLERTYPEID integer not null, primary key (PHONECALLID)) engine=InnoDB
create table source (SOURCEID integer not null auto_increment, NAME varchar(255), DISPLAYORDER integer, primary key (SOURCEID)) engine=InnoDB
alter table person add constraint UK_jnmhkxs5tdukd3cpw93aop3vr unique (EMAIL)
alter table phone_call add constraint UK_b4im4hxwcn3mv2d5yhuld6sf6 unique (EMAIL)
alter table phone_call add constraint FK9ya9u2rigmpcsyk5es4lkm2mp foreign key (AGENCYID) references agency (AGENCYID)
alter table phone_call add constraint FK8na4ciydmxlw62ywiv08m9qfj foreign key (ADVERTID) references advert (ADVERTID)
alter table phone_call add constraint FKp1rwytv5b48icku06ypcemso3 foreign key (APPROVEDBY) references person (PERSONID)
alter table phone_call add constraint FKgi6h6i88i02wdw5ry7pbk28o5 foreign key (NEGOCIATOR) references person (PERSONID)
alter table phone_call add constraint FKp9lf1j7n49pqv9ie08tnhn7h1 foreign key (SOURCEID) references source (SOURCEID)
alter table phone_call add constraint FKnixnm4ik6rh83uqe1vu0osrr8 foreign key (RECEIVEDBY) references person (PERSONID)
alter table phone_call add constraint FK154cyobibs1wbmfpaj4y25wc9 foreign key (FOLLOWEDBY) references person (PERSONID)
alter table phone_call add constraint FKlt1bqtnsejywtr1wrbfa0vogi foreign key (FOLLOWEDBY2) references person (PERSONID)
alter table phone_call add constraint FK7f427a791ehxrmcj6of898oxd foreign key (FOLLOWEDBY3) references person (PERSONID)
alter table phone_call add constraint FK8kirfcxapvdpnrsfedorandrj foreign key (CALLERTYPEID) references caller_type (CALLERTYPEID)
create table advert (ADVERTID integer not null auto_increment, NAME varchar(255), DISPLAYORDER integer, primary key (ADVERTID)) engine=InnoDB
create table agency (AGENCYID integer not null auto_increment, NAME varchar(255), primary key (AGENCYID)) engine=InnoDB
create table caller_type (CALLERTYPEID integer not null auto_increment, NAME varchar(255), DISPLAYORDER integer, primary key (CALLERTYPEID)) engine=InnoDB
create table person (PERSONID integer not null auto_increment, CREATEDON datetime(6), WEBACCOUNTCREATIONDATE datetime(6), WEBLASTVISIT datetime(6), EMAIL varchar(255), ACTIVERECORD bit, DELETED bit, INITIALS varchar(255) not null, WEBACCOUNTNAME varchar(255), WEBACCOUNTPASSWORD varchar(255), NBOFLOGIN integer, LASTNAME varchar(255), FIRSTNAME varchar(255), primary key (PERSONID)) engine=InnoDB
create table phone_call (PHONECALLID integer not null auto_increment, COLOURCODE varchar(255) not null, POSTCODE varchar(5) not null, RECEIVEDON datetime(6), EMAIL varchar(255) not null, ACKNOWLEDGED bit, DELETED bit, COMPLETE bit, ADDRESSLINE1 varchar(255) not null, MOBILENUMBER varchar(255) not null, LASTNAME varchar(255) not null, MANDATENAME varchar(255) not null, OBJECT longtext not null, FIRSTNAME varchar(255) not null, FOLLOWUP longtext, PHONENUMBER varchar(255), CALLTYPE varchar(255) not null, TOWN varchar(255) not null, AGENCYID integer not null, ADVERTID integer, APPROVEDBY integer, NEGOCIATOR integer, SOURCEID integer, RECEIVEDBY integer not null, FOLLOWEDBY integer, FOLLOWEDBY2 integer, FOLLOWEDBY3 integer, CALLERTYPEID integer not null, primary key (PHONECALLID)) engine=InnoDB
create table source (SOURCEID integer not null auto_increment, NAME varchar(255), DISPLAYORDER integer, primary key (SOURCEID)) engine=InnoDB
alter table person add constraint UK_jnmhkxs5tdukd3cpw93aop3vr unique (EMAIL)
alter table phone_call add constraint UK_b4im4hxwcn3mv2d5yhuld6sf6 unique (EMAIL)
alter table phone_call add constraint FK9ya9u2rigmpcsyk5es4lkm2mp foreign key (AGENCYID) references agency (AGENCYID)
alter table phone_call add constraint FK8na4ciydmxlw62ywiv08m9qfj foreign key (ADVERTID) references advert (ADVERTID)
alter table phone_call add constraint FKp1rwytv5b48icku06ypcemso3 foreign key (APPROVEDBY) references person (PERSONID)
alter table phone_call add constraint FKgi6h6i88i02wdw5ry7pbk28o5 foreign key (NEGOCIATOR) references person (PERSONID)
alter table phone_call add constraint FKp9lf1j7n49pqv9ie08tnhn7h1 foreign key (SOURCEID) references source (SOURCEID)
alter table phone_call add constraint FKnixnm4ik6rh83uqe1vu0osrr8 foreign key (RECEIVEDBY) references person (PERSONID)
alter table phone_call add constraint FK154cyobibs1wbmfpaj4y25wc9 foreign key (FOLLOWEDBY) references person (PERSONID)
alter table phone_call add constraint FKlt1bqtnsejywtr1wrbfa0vogi foreign key (FOLLOWEDBY2) references person (PERSONID)
alter table phone_call add constraint FK7f427a791ehxrmcj6of898oxd foreign key (FOLLOWEDBY3) references person (PERSONID)
alter table phone_call add constraint FK8kirfcxapvdpnrsfedorandrj foreign key (CALLERTYPEID) references caller_type (CALLERTYPEID)
create table advert (ADVERTID integer not null auto_increment, NAME varchar(255), DISPLAYORDER integer, primary key (ADVERTID)) engine=InnoDB
create table agency (AGENCYID integer not null auto_increment, NAME varchar(255), primary key (AGENCYID)) engine=InnoDB
create table caller_type (CALLERTYPEID integer not null auto_increment, NAME varchar(255), DISPLAYORDER integer, primary key (CALLERTYPEID)) engine=InnoDB
create table person (PERSONID integer not null auto_increment, CREATEDON datetime(6), WEBACCOUNTCREATIONDATE datetime(6), WEBLASTVISIT datetime(6), EMAIL varchar(255), ACTIVERECORD bit, DELETED bit, INITIALS varchar(255) not null, WEBACCOUNTNAME varchar(255), WEBACCOUNTPASSWORD varchar(255), NBOFLOGIN integer, LASTNAME varchar(255), FIRSTNAME varchar(255), primary key (PERSONID)) engine=InnoDB
create table phone_call (PHONECALLID integer not null auto_increment, COLOURCODE varchar(255) not null, POSTCODE varchar(5) not null, RECEIVEDON datetime(6), EMAIL varchar(255) not null, ACKNOWLEDGED bit, DELETED bit, COMPLETE bit, ADDRESSLINE1 varchar(255) not null, MOBILENUMBER varchar(255) not null, LASTNAME varchar(255) not null, MANDATENAME varchar(255) not null, OBJECT longtext not null, FIRSTNAME varchar(255) not null, FOLLOWUP longtext, PHONENUMBER varchar(255), CALLTYPE varchar(255) not null, TOWN varchar(255) not null, AGENCYID integer not null, ADVERTID integer, APPROVEDBY integer, NEGOCIATOR integer, SOURCEID integer, RECEIVEDBY integer not null, FOLLOWEDBY integer, FOLLOWEDBY2 integer, FOLLOWEDBY3 integer, CALLERTYPEID integer not null, primary key (PHONECALLID)) engine=InnoDB
create table source (SOURCEID integer not null auto_increment, NAME varchar(255), DISPLAYORDER integer, primary key (SOURCEID)) engine=InnoDB
alter table person add constraint UK_jnmhkxs5tdukd3cpw93aop3vr unique (EMAIL)
alter table phone_call add constraint UK_b4im4hxwcn3mv2d5yhuld6sf6 unique (EMAIL)
alter table phone_call add constraint FK9ya9u2rigmpcsyk5es4lkm2mp foreign key (AGENCYID) references agency (AGENCYID)
alter table phone_call add constraint FK8na4ciydmxlw62ywiv08m9qfj foreign key (ADVERTID) references advert (ADVERTID)
alter table phone_call add constraint FKp1rwytv5b48icku06ypcemso3 foreign key (APPROVEDBY) references person (PERSONID)
alter table phone_call add constraint FKgi6h6i88i02wdw5ry7pbk28o5 foreign key (NEGOCIATOR) references person (PERSONID)
alter table phone_call add constraint FKp9lf1j7n49pqv9ie08tnhn7h1 foreign key (SOURCEID) references source (SOURCEID)
alter table phone_call add constraint FKnixnm4ik6rh83uqe1vu0osrr8 foreign key (RECEIVEDBY) references person (PERSONID)
alter table phone_call add constraint FK154cyobibs1wbmfpaj4y25wc9 foreign key (FOLLOWEDBY) references person (PERSONID)
alter table phone_call add constraint FKlt1bqtnsejywtr1wrbfa0vogi foreign key (FOLLOWEDBY2) references person (PERSONID)
alter table phone_call add constraint FK7f427a791ehxrmcj6of898oxd foreign key (FOLLOWEDBY3) references person (PERSONID)
alter table phone_call add constraint FK8kirfcxapvdpnrsfedorandrj foreign key (CALLERTYPEID) references caller_type (CALLERTYPEID)
create table advert (ADVERTID integer not null auto_increment, NAME varchar(255), DISPLAYORDER integer, primary key (ADVERTID)) engine=InnoDB
create table agency (AGENCYID integer not null auto_increment, NAME varchar(255), primary key (AGENCYID)) engine=InnoDB
create table caller_type (CALLERTYPEID integer not null auto_increment, NAME varchar(255), DISPLAYORDER integer, primary key (CALLERTYPEID)) engine=InnoDB
create table person (PERSONID integer not null auto_increment, CREATEDON datetime(6), WEBACCOUNTCREATIONDATE datetime(6), WEBLASTVISIT datetime(6), EMAIL varchar(255), ACTIVERECORD bit, DELETED bit, INITIALS varchar(255) not null, WEBACCOUNTNAME varchar(255), WEBACCOUNTPASSWORD varchar(255), NBOFLOGIN integer, LASTNAME varchar(255), FIRSTNAME varchar(255), primary key (PERSONID)) engine=InnoDB
create table phone_call (PHONECALLID integer not null auto_increment, COLOURCODE varchar(255) not null, POSTCODE varchar(5) not null, RECEIVEDON datetime(6), EMAIL varchar(255) not null, ACKNOWLEDGED bit, DELETED bit, COMPLETE bit, ADDRESSLINE1 varchar(255) not null, MOBILENUMBER varchar(255) not null, LASTNAME varchar(255) not null, MANDATENAME varchar(255) not null, OBJECT longtext not null, FIRSTNAME varchar(255) not null, FOLLOWUP longtext, PHONENUMBER varchar(255), CALLTYPE varchar(255) not null, TOWN varchar(255) not null, AGENCYID integer not null, ADVERTID integer, APPROVEDBY integer, NEGOCIATOR integer, SOURCEID integer, RECEIVEDBY integer not null, FOLLOWEDBY integer, FOLLOWEDBY2 integer, FOLLOWEDBY3 integer, CALLERTYPEID integer not null, primary key (PHONECALLID)) engine=InnoDB
create table source (SOURCEID integer not null auto_increment, NAME varchar(255), DISPLAYORDER integer, primary key (SOURCEID)) engine=InnoDB
alter table person add constraint UK_jnmhkxs5tdukd3cpw93aop3vr unique (EMAIL)
alter table phone_call add constraint UK_b4im4hxwcn3mv2d5yhuld6sf6 unique (EMAIL)
alter table phone_call add constraint FK9ya9u2rigmpcsyk5es4lkm2mp foreign key (AGENCYID) references agency (AGENCYID)
alter table phone_call add constraint FK8na4ciydmxlw62ywiv08m9qfj foreign key (ADVERTID) references advert (ADVERTID)
alter table phone_call add constraint FKp1rwytv5b48icku06ypcemso3 foreign key (APPROVEDBY) references person (PERSONID)
alter table phone_call add constraint FKgi6h6i88i02wdw5ry7pbk28o5 foreign key (NEGOCIATOR) references person (PERSONID)
alter table phone_call add constraint FKp9lf1j7n49pqv9ie08tnhn7h1 foreign key (SOURCEID) references source (SOURCEID)
alter table phone_call add constraint FKnixnm4ik6rh83uqe1vu0osrr8 foreign key (RECEIVEDBY) references person (PERSONID)
alter table phone_call add constraint FK154cyobibs1wbmfpaj4y25wc9 foreign key (FOLLOWEDBY) references person (PERSONID)
alter table phone_call add constraint FKlt1bqtnsejywtr1wrbfa0vogi foreign key (FOLLOWEDBY2) references person (PERSONID)
alter table phone_call add constraint FK7f427a791ehxrmcj6of898oxd foreign key (FOLLOWEDBY3) references person (PERSONID)
alter table phone_call add constraint FK8kirfcxapvdpnrsfedorandrj foreign key (CALLERTYPEID) references caller_type (CALLERTYPEID)
create table advert (ADVERTID integer not null auto_increment, NAME varchar(255), DISPLAYORDER integer, primary key (ADVERTID)) engine=InnoDB
create table agency (AGENCYID integer not null auto_increment, NAME varchar(255), primary key (AGENCYID)) engine=InnoDB
create table caller_type (CALLERTYPEID integer not null auto_increment, NAME varchar(255), DISPLAYORDER integer, primary key (CALLERTYPEID)) engine=InnoDB
create table person (PERSONID integer not null auto_increment, CREATEDON datetime(6), WEBACCOUNTCREATIONDATE datetime(6), WEBLASTVISIT datetime(6), EMAIL varchar(255), ACTIVERECORD bit, DELETED bit, INITIALS varchar(255) not null, WEBACCOUNTNAME varchar(255), WEBACCOUNTPASSWORD varchar(255), NBOFLOGIN integer, LASTNAME varchar(255), FIRSTNAME varchar(255), primary key (PERSONID)) engine=InnoDB
create table phone_call (PHONECALLID integer not null auto_increment, COLOURCODE varchar(255) not null, POSTCODE varchar(5) not null, RECEIVEDON datetime(6), EMAIL varchar(255) not null, ACKNOWLEDGED bit, DELETED bit, COMPLETE bit, ADDRESSLINE1 varchar(255) not null, MOBILENUMBER varchar(255) not null, LASTNAME varchar(255) not null, MANDATENAME varchar(255) not null, OBJECT longtext not null, FIRSTNAME varchar(255) not null, FOLLOWUP longtext, PHONENUMBER varchar(255), CALLTYPE varchar(255) not null, TOWN varchar(255) not null, AGENCYID integer not null, ADVERTID integer, APPROVEDBY integer, NEGOCIATOR integer, SOURCEID integer, RECEIVEDBY integer not null, FOLLOWEDBY integer, FOLLOWEDBY2 integer, FOLLOWEDBY3 integer, CALLERTYPEID integer not null, primary key (PHONECALLID)) engine=InnoDB
create table source (SOURCEID integer not null auto_increment, NAME varchar(255), DISPLAYORDER integer, primary key (SOURCEID)) engine=InnoDB
alter table person add constraint UK_jnmhkxs5tdukd3cpw93aop3vr unique (EMAIL)
alter table phone_call add constraint UK_b4im4hxwcn3mv2d5yhuld6sf6 unique (EMAIL)
alter table phone_call add constraint FK9ya9u2rigmpcsyk5es4lkm2mp foreign key (AGENCYID) references agency (AGENCYID)
alter table phone_call add constraint FK8na4ciydmxlw62ywiv08m9qfj foreign key (ADVERTID) references advert (ADVERTID)
alter table phone_call add constraint FKp1rwytv5b48icku06ypcemso3 foreign key (APPROVEDBY) references person (PERSONID)
alter table phone_call add constraint FKgi6h6i88i02wdw5ry7pbk28o5 foreign key (NEGOCIATOR) references person (PERSONID)
alter table phone_call add constraint FKp9lf1j7n49pqv9ie08tnhn7h1 foreign key (SOURCEID) references source (SOURCEID)
alter table phone_call add constraint FKnixnm4ik6rh83uqe1vu0osrr8 foreign key (RECEIVEDBY) references person (PERSONID)
alter table phone_call add constraint FK154cyobibs1wbmfpaj4y25wc9 foreign key (FOLLOWEDBY) references person (PERSONID)
alter table phone_call add constraint FKlt1bqtnsejywtr1wrbfa0vogi foreign key (FOLLOWEDBY2) references person (PERSONID)
alter table phone_call add constraint FK7f427a791ehxrmcj6of898oxd foreign key (FOLLOWEDBY3) references person (PERSONID)
alter table phone_call add constraint FK8kirfcxapvdpnrsfedorandrj foreign key (CALLERTYPEID) references caller_type (CALLERTYPEID)
create table advert (ADVERTID integer not null auto_increment, NAME varchar(255), DISPLAYORDER integer, primary key (ADVERTID)) engine=InnoDB
create table agency (AGENCYID integer not null auto_increment, NAME varchar(255), primary key (AGENCYID)) engine=InnoDB
create table caller_type (CALLERTYPEID integer not null auto_increment, NAME varchar(255), DISPLAYORDER integer, primary key (CALLERTYPEID)) engine=InnoDB
create table person (PERSONID integer not null auto_increment, CREATEDON datetime(6), WEBACCOUNTCREATIONDATE datetime(6), WEBLASTVISIT datetime(6), EMAIL varchar(255), ACTIVERECORD bit, DELETED bit, INITIALS varchar(255) not null, WEBACCOUNTNAME varchar(255), WEBACCOUNTPASSWORD varchar(255), NBOFLOGIN integer, LASTNAME varchar(255), FIRSTNAME varchar(255), primary key (PERSONID)) engine=InnoDB
create table phone_call (PHONECALLID integer not null auto_increment, COLOURCODE varchar(255) not null, POSTCODE varchar(5) not null, RECEIVEDON datetime(6), EMAIL varchar(255) not null, ACKNOWLEDGED bit, DELETED bit, COMPLETE bit, ADDRESSLINE1 varchar(255) not null, MOBILENUMBER varchar(255) not null, LASTNAME varchar(255) not null, MANDATENAME varchar(255) not null, OBJECT longtext not null, FIRSTNAME varchar(255) not null, FOLLOWUP longtext, PHONENUMBER varchar(255), CALLTYPE varchar(255) not null, TOWN varchar(255) not null, AGENCYID integer not null, ADVERTID integer, APPROVEDBY integer, NEGOCIATOR integer, SOURCEID integer, RECEIVEDBY integer not null, FOLLOWEDBY integer, FOLLOWEDBY2 integer, FOLLOWEDBY3 integer, CALLERTYPEID integer not null, primary key (PHONECALLID)) engine=InnoDB
create table source (SOURCEID integer not null auto_increment, NAME varchar(255), DISPLAYORDER integer, primary key (SOURCEID)) engine=InnoDB
alter table person add constraint UK_jnmhkxs5tdukd3cpw93aop3vr unique (EMAIL)
alter table phone_call add constraint UK_b4im4hxwcn3mv2d5yhuld6sf6 unique (EMAIL)
alter table phone_call add constraint FK9ya9u2rigmpcsyk5es4lkm2mp foreign key (AGENCYID) references agency (AGENCYID)
alter table phone_call add constraint FK8na4ciydmxlw62ywiv08m9qfj foreign key (ADVERTID) references advert (ADVERTID)
alter table phone_call add constraint FKp1rwytv5b48icku06ypcemso3 foreign key (APPROVEDBY) references person (PERSONID)
alter table phone_call add constraint FKgi6h6i88i02wdw5ry7pbk28o5 foreign key (NEGOCIATOR) references person (PERSONID)
alter table phone_call add constraint FKp9lf1j7n49pqv9ie08tnhn7h1 foreign key (SOURCEID) references source (SOURCEID)
alter table phone_call add constraint FKnixnm4ik6rh83uqe1vu0osrr8 foreign key (RECEIVEDBY) references person (PERSONID)
alter table phone_call add constraint FK154cyobibs1wbmfpaj4y25wc9 foreign key (FOLLOWEDBY) references person (PERSONID)
alter table phone_call add constraint FKlt1bqtnsejywtr1wrbfa0vogi foreign key (FOLLOWEDBY2) references person (PERSONID)
alter table phone_call add constraint FK7f427a791ehxrmcj6of898oxd foreign key (FOLLOWEDBY3) references person (PERSONID)
alter table phone_call add constraint FK8kirfcxapvdpnrsfedorandrj foreign key (CALLERTYPEID) references caller_type (CALLERTYPEID)
create table advert (ADVERTID integer not null auto_increment, NAME varchar(255), DISPLAYORDER integer, primary key (ADVERTID)) engine=InnoDB
create table agency (AGENCYID integer not null auto_increment, NAME varchar(255), primary key (AGENCYID)) engine=InnoDB
create table caller_type (CALLERTYPEID integer not null auto_increment, NAME varchar(255), DISPLAYORDER integer, primary key (CALLERTYPEID)) engine=InnoDB
create table person (PERSONID integer not null auto_increment, CREATEDON datetime(6), WEBACCOUNTCREATIONDATE datetime(6), WEBLASTVISIT datetime(6), EMAIL varchar(255), ACTIVERECORD bit, DELETED bit, INITIALS varchar(255) not null, WEBACCOUNTNAME varchar(255), WEBACCOUNTPASSWORD varchar(255), NBOFLOGIN integer, LASTNAME varchar(255), FIRSTNAME varchar(255), primary key (PERSONID)) engine=InnoDB
create table phone_call (PHONECALLID integer not null auto_increment, COLOURCODE varchar(255) not null, POSTCODE varchar(5) not null, RECEIVEDON datetime(6), EMAIL varchar(255) not null, ACKNOWLEDGED bit, DELETED bit, COMPLETE bit, ADDRESSLINE1 varchar(255) not null, MOBILENUMBER varchar(255) not null, LASTNAME varchar(255) not null, MANDATENAME varchar(255) not null, OBJECT longtext not null, FIRSTNAME varchar(255) not null, FOLLOWUP longtext, PHONENUMBER varchar(255), CALLTYPE varchar(255) not null, TOWN varchar(255) not null, AGENCYID integer not null, ADVERTID integer, APPROVEDBY integer, NEGOCIATOR integer, SOURCEID integer, RECEIVEDBY integer not null, FOLLOWEDBY integer, FOLLOWEDBY2 integer, FOLLOWEDBY3 integer, CALLERTYPEID integer not null, primary key (PHONECALLID)) engine=InnoDB
create table source (SOURCEID integer not null auto_increment, NAME varchar(255), DISPLAYORDER integer, primary key (SOURCEID)) engine=InnoDB
alter table person add constraint UK_jnmhkxs5tdukd3cpw93aop3vr unique (EMAIL)
alter table phone_call add constraint UK_b4im4hxwcn3mv2d5yhuld6sf6 unique (EMAIL)
alter table phone_call add constraint FK9ya9u2rigmpcsyk5es4lkm2mp foreign key (AGENCYID) references agency (AGENCYID)
alter table phone_call add constraint FK8na4ciydmxlw62ywiv08m9qfj foreign key (ADVERTID) references advert (ADVERTID)
alter table phone_call add constraint FKp1rwytv5b48icku06ypcemso3 foreign key (APPROVEDBY) references person (PERSONID)
alter table phone_call add constraint FKgi6h6i88i02wdw5ry7pbk28o5 foreign key (NEGOCIATOR) references person (PERSONID)
alter table phone_call add constraint FKp9lf1j7n49pqv9ie08tnhn7h1 foreign key (SOURCEID) references source (SOURCEID)
alter table phone_call add constraint FKnixnm4ik6rh83uqe1vu0osrr8 foreign key (RECEIVEDBY) references person (PERSONID)
alter table phone_call add constraint FK154cyobibs1wbmfpaj4y25wc9 foreign key (FOLLOWEDBY) references person (PERSONID)
alter table phone_call add constraint FKlt1bqtnsejywtr1wrbfa0vogi foreign key (FOLLOWEDBY2) references person (PERSONID)
alter table phone_call add constraint FK7f427a791ehxrmcj6of898oxd foreign key (FOLLOWEDBY3) references person (PERSONID)
alter table phone_call add constraint FK8kirfcxapvdpnrsfedorandrj foreign key (CALLERTYPEID) references caller_type (CALLERTYPEID)
create table advert (ADVERTID integer not null auto_increment, NAME varchar(255), DISPLAYORDER integer, primary key (ADVERTID)) engine=InnoDB
create table agency (AGENCYID integer not null auto_increment, NAME varchar(255), primary key (AGENCYID)) engine=InnoDB
create table caller_type (CALLERTYPEID integer not null auto_increment, NAME varchar(255), DISPLAYORDER integer, primary key (CALLERTYPEID)) engine=InnoDB
create table person (PERSONID integer not null auto_increment, CREATEDON datetime(6), WEBACCOUNTCREATIONDATE datetime(6), WEBLASTVISIT datetime(6), EMAIL varchar(255), ACTIVERECORD bit, DELETED bit, INITIALS varchar(255) not null, WEBACCOUNTNAME varchar(255), WEBACCOUNTPASSWORD varchar(255), NBOFLOGIN integer, LASTNAME varchar(255), FIRSTNAME varchar(255), primary key (PERSONID)) engine=InnoDB
create table phone_call (PHONECALLID integer not null auto_increment, COLOURCODE varchar(255) not null, POSTCODE varchar(5) not null, RECEIVEDON datetime(6), EMAIL varchar(255) not null, ACKNOWLEDGED bit, DELETED bit, COMPLETE bit, ADDRESSLINE1 varchar(255) not null, MOBILENUMBER varchar(255) not null, LASTNAME varchar(255) not null, MANDATENAME varchar(255) not null, OBJECT longtext not null, FIRSTNAME varchar(255) not null, FOLLOWUP longtext, PHONENUMBER varchar(255), CALLTYPE varchar(255) not null, TOWN varchar(255) not null, AGENCYID integer not null, ADVERTID integer, APPROVEDBY integer, NEGOCIATOR integer, SOURCEID integer, RECEIVEDBY integer not null, FOLLOWEDBY integer, FOLLOWEDBY2 integer, FOLLOWEDBY3 integer, CALLERTYPEID integer not null, primary key (PHONECALLID)) engine=InnoDB
create table source (SOURCEID integer not null auto_increment, NAME varchar(255), DISPLAYORDER integer, primary key (SOURCEID)) engine=InnoDB
alter table person add constraint UK_jnmhkxs5tdukd3cpw93aop3vr unique (EMAIL)
alter table phone_call add constraint UK_b4im4hxwcn3mv2d5yhuld6sf6 unique (EMAIL)
alter table phone_call add constraint FK9ya9u2rigmpcsyk5es4lkm2mp foreign key (AGENCYID) references agency (AGENCYID)
alter table phone_call add constraint FK8na4ciydmxlw62ywiv08m9qfj foreign key (ADVERTID) references advert (ADVERTID)
alter table phone_call add constraint FKp1rwytv5b48icku06ypcemso3 foreign key (APPROVEDBY) references person (PERSONID)
alter table phone_call add constraint FKgi6h6i88i02wdw5ry7pbk28o5 foreign key (NEGOCIATOR) references person (PERSONID)
alter table phone_call add constraint FKp9lf1j7n49pqv9ie08tnhn7h1 foreign key (SOURCEID) references source (SOURCEID)
alter table phone_call add constraint FKnixnm4ik6rh83uqe1vu0osrr8 foreign key (RECEIVEDBY) references person (PERSONID)
alter table phone_call add constraint FK154cyobibs1wbmfpaj4y25wc9 foreign key (FOLLOWEDBY) references person (PERSONID)
alter table phone_call add constraint FKlt1bqtnsejywtr1wrbfa0vogi foreign key (FOLLOWEDBY2) references person (PERSONID)
alter table phone_call add constraint FK7f427a791ehxrmcj6of898oxd foreign key (FOLLOWEDBY3) references person (PERSONID)
alter table phone_call add constraint FK8kirfcxapvdpnrsfedorandrj foreign key (CALLERTYPEID) references caller_type (CALLERTYPEID)
create table advert (ADVERTID integer not null auto_increment, NAME varchar(255), DISPLAYORDER integer, primary key (ADVERTID)) engine=InnoDB
create table agency (AGENCYID integer not null auto_increment, NAME varchar(255), primary key (AGENCYID)) engine=InnoDB
create table caller_type (CALLERTYPEID integer not null auto_increment, NAME varchar(255), DISPLAYORDER integer, primary key (CALLERTYPEID)) engine=InnoDB
create table person (PERSONID integer not null auto_increment, CREATEDON datetime(6), WEBACCOUNTCREATIONDATE datetime(6), WEBLASTVISIT datetime(6), EMAIL varchar(255), ACTIVERECORD bit, DELETED bit, INITIALS varchar(255) not null, WEBACCOUNTNAME varchar(255), WEBACCOUNTPASSWORD varchar(255), NBOFLOGIN integer, LASTNAME varchar(255), FIRSTNAME varchar(255), primary key (PERSONID)) engine=InnoDB
create table phone_call (PHONECALLID integer not null auto_increment, COLOURCODE varchar(255) not null, POSTCODE varchar(5) not null, RECEIVEDON datetime(6), EMAIL varchar(255) not null, ACKNOWLEDGED bit, DELETED bit, COMPLETE bit, ADDRESSLINE1 varchar(255) not null, MOBILENUMBER varchar(255) not null, LASTNAME varchar(255) not null, MANDATENAME varchar(255) not null, OBJECT longtext not null, FIRSTNAME varchar(255) not null, FOLLOWUP longtext, PHONENUMBER varchar(255), CALLTYPE varchar(255) not null, TOWN varchar(255) not null, AGENCYID integer not null, ADVERTID integer, APPROVEDBY integer, NEGOCIATOR integer, SOURCEID integer, RECEIVEDBY integer not null, FOLLOWEDBY integer, FOLLOWEDBY2 integer, FOLLOWEDBY3 integer, CALLERTYPEID integer not null, primary key (PHONECALLID)) engine=InnoDB
create table source (SOURCEID integer not null auto_increment, NAME varchar(255), DISPLAYORDER integer, primary key (SOURCEID)) engine=InnoDB
alter table person add constraint UK_jnmhkxs5tdukd3cpw93aop3vr unique (EMAIL)
alter table phone_call add constraint UK_b4im4hxwcn3mv2d5yhuld6sf6 unique (EMAIL)
alter table phone_call add constraint FK9ya9u2rigmpcsyk5es4lkm2mp foreign key (AGENCYID) references agency (AGENCYID)
alter table phone_call add constraint FK8na4ciydmxlw62ywiv08m9qfj foreign key (ADVERTID) references advert (ADVERTID)
alter table phone_call add constraint FKp1rwytv5b48icku06ypcemso3 foreign key (APPROVEDBY) references person (PERSONID)
alter table phone_call add constraint FKgi6h6i88i02wdw5ry7pbk28o5 foreign key (NEGOCIATOR) references person (PERSONID)
alter table phone_call add constraint FKp9lf1j7n49pqv9ie08tnhn7h1 foreign key (SOURCEID) references source (SOURCEID)
alter table phone_call add constraint FKnixnm4ik6rh83uqe1vu0osrr8 foreign key (RECEIVEDBY) references person (PERSONID)
alter table phone_call add constraint FK154cyobibs1wbmfpaj4y25wc9 foreign key (FOLLOWEDBY) references person (PERSONID)
alter table phone_call add constraint FKlt1bqtnsejywtr1wrbfa0vogi foreign key (FOLLOWEDBY2) references person (PERSONID)
alter table phone_call add constraint FK7f427a791ehxrmcj6of898oxd foreign key (FOLLOWEDBY3) references person (PERSONID)
alter table phone_call add constraint FK8kirfcxapvdpnrsfedorandrj foreign key (CALLERTYPEID) references caller_type (CALLERTYPEID)
create table advert (ADVERTID integer not null auto_increment, NAME varchar(255), DISPLAYORDER integer, primary key (ADVERTID)) engine=InnoDB
create table agency (AGENCYID integer not null auto_increment, NAME varchar(255), primary key (AGENCYID)) engine=InnoDB
create table caller_type (CALLERTYPEID integer not null auto_increment, NAME varchar(255), DISPLAYORDER integer, primary key (CALLERTYPEID)) engine=InnoDB
create table person (PERSONID integer not null auto_increment, CREATEDON datetime(6), WEBACCOUNTCREATIONDATE datetime(6), WEBLASTVISIT datetime(6), EMAIL varchar(255), ACTIVERECORD bit, DELETED bit, INITIALS varchar(255) not null, WEBACCOUNTNAME varchar(255), WEBACCOUNTPASSWORD varchar(255), NBOFLOGIN integer, LASTNAME varchar(255), FIRSTNAME varchar(255), primary key (PERSONID)) engine=InnoDB
create table phone_call (PHONECALLID integer not null auto_increment, COLOURCODE varchar(255) not null, POSTCODE varchar(5) not null, RECEIVEDON datetime(6), EMAIL varchar(255) not null, ACKNOWLEDGED bit, DELETED bit, COMPLETE bit, ADDRESSLINE1 varchar(255) not null, MOBILENUMBER varchar(255) not null, LASTNAME varchar(255) not null, MANDATENAME varchar(255) not null, OBJECT longtext not null, FIRSTNAME varchar(255) not null, FOLLOWUP longtext, PHONENUMBER varchar(255), CALLTYPE varchar(255) not null, TOWN varchar(255) not null, AGENCYID integer not null, ADVERTID integer, APPROVEDBY integer, NEGOCIATOR integer, SOURCEID integer, RECEIVEDBY integer not null, FOLLOWEDBY integer, FOLLOWEDBY2 integer, FOLLOWEDBY3 integer, CALLERTYPEID integer not null, primary key (PHONECALLID)) engine=InnoDB
create table source (SOURCEID integer not null auto_increment, NAME varchar(255), DISPLAYORDER integer, primary key (SOURCEID)) engine=InnoDB
alter table person add constraint UK_jnmhkxs5tdukd3cpw93aop3vr unique (EMAIL)
alter table phone_call add constraint UK_b4im4hxwcn3mv2d5yhuld6sf6 unique (EMAIL)
alter table phone_call add constraint FK9ya9u2rigmpcsyk5es4lkm2mp foreign key (AGENCYID) references agency (AGENCYID)
alter table phone_call add constraint FK8na4ciydmxlw62ywiv08m9qfj foreign key (ADVERTID) references advert (ADVERTID)
alter table phone_call add constraint FKp1rwytv5b48icku06ypcemso3 foreign key (APPROVEDBY) references person (PERSONID)
alter table phone_call add constraint FKgi6h6i88i02wdw5ry7pbk28o5 foreign key (NEGOCIATOR) references person (PERSONID)
alter table phone_call add constraint FKp9lf1j7n49pqv9ie08tnhn7h1 foreign key (SOURCEID) references source (SOURCEID)
alter table phone_call add constraint FKnixnm4ik6rh83uqe1vu0osrr8 foreign key (RECEIVEDBY) references person (PERSONID)
alter table phone_call add constraint FK154cyobibs1wbmfpaj4y25wc9 foreign key (FOLLOWEDBY) references person (PERSONID)
alter table phone_call add constraint FKlt1bqtnsejywtr1wrbfa0vogi foreign key (FOLLOWEDBY2) references person (PERSONID)
alter table phone_call add constraint FK7f427a791ehxrmcj6of898oxd foreign key (FOLLOWEDBY3) references person (PERSONID)
alter table phone_call add constraint FK8kirfcxapvdpnrsfedorandrj foreign key (CALLERTYPEID) references caller_type (CALLERTYPEID)
create table advert (ADVERTID integer not null auto_increment, NAME varchar(255), DISPLAYORDER integer, primary key (ADVERTID)) engine=InnoDB
create table agency (AGENCYID integer not null auto_increment, NAME varchar(255), primary key (AGENCYID)) engine=InnoDB
create table caller_type (CALLERTYPEID integer not null auto_increment, NAME varchar(255), DISPLAYORDER integer, primary key (CALLERTYPEID)) engine=InnoDB
create table person (PERSONID integer not null auto_increment, CREATEDON datetime(6), WEBACCOUNTCREATIONDATE datetime(6), WEBLASTVISIT datetime(6), EMAIL varchar(255), ACTIVERECORD bit, DELETED bit, INITIALS varchar(255) not null, WEBACCOUNTNAME varchar(255), WEBACCOUNTPASSWORD varchar(255), NBOFLOGIN integer, LASTNAME varchar(255), FIRSTNAME varchar(255), primary key (PERSONID)) engine=InnoDB
create table phone_call (PHONECALLID integer not null auto_increment, COLOURCODE varchar(255) not null, POSTCODE varchar(5) not null, RECEIVEDON datetime(6), EMAIL varchar(255) not null, ACKNOWLEDGED bit, DELETED bit, COMPLETE bit, ADDRESSLINE1 varchar(255) not null, MOBILENUMBER varchar(255) not null, LASTNAME varchar(255) not null, MANDATENAME varchar(255) not null, OBJECT longtext not null, FIRSTNAME varchar(255) not null, FOLLOWUP longtext, PHONENUMBER varchar(255), CALLTYPE varchar(255) not null, TOWN varchar(255) not null, AGENCYID integer not null, ADVERTID integer, APPROVEDBY integer, NEGOCIATOR integer, SOURCEID integer, RECEIVEDBY integer not null, FOLLOWEDBY integer, FOLLOWEDBY2 integer, FOLLOWEDBY3 integer, CALLERTYPEID integer not null, primary key (PHONECALLID)) engine=InnoDB
create table source (SOURCEID integer not null auto_increment, NAME varchar(255), DISPLAYORDER integer, primary key (SOURCEID)) engine=InnoDB
alter table person add constraint UK_jnmhkxs5tdukd3cpw93aop3vr unique (EMAIL)
alter table phone_call add constraint UK_b4im4hxwcn3mv2d5yhuld6sf6 unique (EMAIL)
alter table phone_call add constraint FK9ya9u2rigmpcsyk5es4lkm2mp foreign key (AGENCYID) references agency (AGENCYID)
alter table phone_call add constraint FK8na4ciydmxlw62ywiv08m9qfj foreign key (ADVERTID) references advert (ADVERTID)
alter table phone_call add constraint FKp1rwytv5b48icku06ypcemso3 foreign key (APPROVEDBY) references person (PERSONID)
alter table phone_call add constraint FKgi6h6i88i02wdw5ry7pbk28o5 foreign key (NEGOCIATOR) references person (PERSONID)
alter table phone_call add constraint FKp9lf1j7n49pqv9ie08tnhn7h1 foreign key (SOURCEID) references source (SOURCEID)
alter table phone_call add constraint FKnixnm4ik6rh83uqe1vu0osrr8 foreign key (RECEIVEDBY) references person (PERSONID)
alter table phone_call add constraint FK154cyobibs1wbmfpaj4y25wc9 foreign key (FOLLOWEDBY) references person (PERSONID)
alter table phone_call add constraint FKlt1bqtnsejywtr1wrbfa0vogi foreign key (FOLLOWEDBY2) references person (PERSONID)
alter table phone_call add constraint FK7f427a791ehxrmcj6of898oxd foreign key (FOLLOWEDBY3) references person (PERSONID)
alter table phone_call add constraint FK8kirfcxapvdpnrsfedorandrj foreign key (CALLERTYPEID) references caller_type (CALLERTYPEID)
create table advert (ADVERTID integer not null auto_increment, NAME varchar(255), DISPLAYORDER integer, primary key (ADVERTID)) engine=InnoDB
create table agency (AGENCYID integer not null auto_increment, NAME varchar(255), primary key (AGENCYID)) engine=InnoDB
create table caller_type (CALLERTYPEID integer not null auto_increment, NAME varchar(255), DISPLAYORDER integer, primary key (CALLERTYPEID)) engine=InnoDB
create table person (PERSONID integer not null auto_increment, CREATEDON datetime(6), WEBACCOUNTCREATIONDATE datetime(6), WEBLASTVISIT datetime(6), EMAIL varchar(255), ACTIVERECORD bit, DELETED bit, INITIALS varchar(255) not null, WEBACCOUNTNAME varchar(255), WEBACCOUNTPASSWORD varchar(255), NBOFLOGIN integer, LASTNAME varchar(255), FIRSTNAME varchar(255), primary key (PERSONID)) engine=InnoDB
create table phone_call (PHONECALLID integer not null auto_increment, COLOURCODE varchar(255) not null, POSTCODE varchar(5) not null, RECEIVEDON datetime(6), EMAIL varchar(255) not null, ACKNOWLEDGED bit, DELETED bit, COMPLETE bit, ADDRESSLINE1 varchar(255) not null, MOBILENUMBER varchar(255) not null, LASTNAME varchar(255) not null, MANDATENAME varchar(255) not null, OBJECT longtext not null, FIRSTNAME varchar(255) not null, FOLLOWUP longtext, PHONENUMBER varchar(255), CALLTYPE varchar(255) not null, TOWN varchar(255) not null, AGENCYID integer not null, ADVERTID integer, APPROVEDBY integer, NEGOCIATOR integer, SOURCEID integer, RECEIVEDBY integer not null, FOLLOWEDBY integer, FOLLOWEDBY2 integer, FOLLOWEDBY3 integer, CALLERTYPEID integer not null, primary key (PHONECALLID)) engine=InnoDB
create table source (SOURCEID integer not null auto_increment, NAME varchar(255), DISPLAYORDER integer, primary key (SOURCEID)) engine=InnoDB
alter table person add constraint UK_jnmhkxs5tdukd3cpw93aop3vr unique (EMAIL)
alter table phone_call add constraint UK_b4im4hxwcn3mv2d5yhuld6sf6 unique (EMAIL)
alter table phone_call add constraint FK9ya9u2rigmpcsyk5es4lkm2mp foreign key (AGENCYID) references agency (AGENCYID)
alter table phone_call add constraint FK8na4ciydmxlw62ywiv08m9qfj foreign key (ADVERTID) references advert (ADVERTID)
alter table phone_call add constraint FKp1rwytv5b48icku06ypcemso3 foreign key (APPROVEDBY) references person (PERSONID)
alter table phone_call add constraint FKgi6h6i88i02wdw5ry7pbk28o5 foreign key (NEGOCIATOR) references person (PERSONID)
alter table phone_call add constraint FKp9lf1j7n49pqv9ie08tnhn7h1 foreign key (SOURCEID) references source (SOURCEID)
alter table phone_call add constraint FKnixnm4ik6rh83uqe1vu0osrr8 foreign key (RECEIVEDBY) references person (PERSONID)
alter table phone_call add constraint FK154cyobibs1wbmfpaj4y25wc9 foreign key (FOLLOWEDBY) references person (PERSONID)
alter table phone_call add constraint FKlt1bqtnsejywtr1wrbfa0vogi foreign key (FOLLOWEDBY2) references person (PERSONID)
alter table phone_call add constraint FK7f427a791ehxrmcj6of898oxd foreign key (FOLLOWEDBY3) references person (PERSONID)
alter table phone_call add constraint FK8kirfcxapvdpnrsfedorandrj foreign key (CALLERTYPEID) references caller_type (CALLERTYPEID)
create table advert (ADVERTID integer not null auto_increment, NAME varchar(255), DISPLAYORDER integer, primary key (ADVERTID)) engine=InnoDB
create table agency (AGENCYID integer not null auto_increment, NAME varchar(255), primary key (AGENCYID)) engine=InnoDB
create table caller_type (CALLERTYPEID integer not null auto_increment, NAME varchar(255), DISPLAYORDER integer, primary key (CALLERTYPEID)) engine=InnoDB
create table person (PERSONID integer not null auto_increment, CREATEDON datetime(6), WEBACCOUNTCREATIONDATE datetime(6), WEBLASTVISIT datetime(6), EMAIL varchar(255), ACTIVERECORD bit, DELETED bit, INITIALS varchar(255) not null, WEBACCOUNTNAME varchar(255), WEBACCOUNTPASSWORD varchar(255), NBOFLOGIN integer, LASTNAME varchar(255), FIRSTNAME varchar(255), primary key (PERSONID)) engine=InnoDB
create table phone_call (PHONECALLID integer not null auto_increment, COLOURCODE varchar(255) not null, POSTCODE varchar(5) not null, RECEIVEDON datetime(6), EMAIL varchar(255) not null, ACKNOWLEDGED bit, DELETED bit, COMPLETE bit, ADDRESSLINE1 varchar(255) not null, MOBILENUMBER varchar(255) not null, LASTNAME varchar(255) not null, MANDATENAME varchar(255) not null, OBJECT longtext not null, FIRSTNAME varchar(255) not null, FOLLOWUP longtext, PHONENUMBER varchar(255), CALLTYPE varchar(255) not null, TOWN varchar(255) not null, AGENCYID integer not null, ADVERTID integer, APPROVEDBY integer, NEGOCIATOR integer, SOURCEID integer, RECEIVEDBY integer not null, FOLLOWEDBY integer, FOLLOWEDBY2 integer, FOLLOWEDBY3 integer, CALLERTYPEID integer not null, primary key (PHONECALLID)) engine=InnoDB
create table source (SOURCEID integer not null auto_increment, NAME varchar(255), DISPLAYORDER integer, primary key (SOURCEID)) engine=InnoDB
alter table person add constraint UK_jnmhkxs5tdukd3cpw93aop3vr unique (EMAIL)
alter table phone_call add constraint UK_b4im4hxwcn3mv2d5yhuld6sf6 unique (EMAIL)
alter table phone_call add constraint FK9ya9u2rigmpcsyk5es4lkm2mp foreign key (AGENCYID) references agency (AGENCYID)
alter table phone_call add constraint FK8na4ciydmxlw62ywiv08m9qfj foreign key (ADVERTID) references advert (ADVERTID)
alter table phone_call add constraint FKp1rwytv5b48icku06ypcemso3 foreign key (APPROVEDBY) references person (PERSONID)
alter table phone_call add constraint FKgi6h6i88i02wdw5ry7pbk28o5 foreign key (NEGOCIATOR) references person (PERSONID)
alter table phone_call add constraint FKp9lf1j7n49pqv9ie08tnhn7h1 foreign key (SOURCEID) references source (SOURCEID)
alter table phone_call add constraint FKnixnm4ik6rh83uqe1vu0osrr8 foreign key (RECEIVEDBY) references person (PERSONID)
alter table phone_call add constraint FK154cyobibs1wbmfpaj4y25wc9 foreign key (FOLLOWEDBY) references person (PERSONID)
alter table phone_call add constraint FKlt1bqtnsejywtr1wrbfa0vogi foreign key (FOLLOWEDBY2) references person (PERSONID)
alter table phone_call add constraint FK7f427a791ehxrmcj6of898oxd foreign key (FOLLOWEDBY3) references person (PERSONID)
alter table phone_call add constraint FK8kirfcxapvdpnrsfedorandrj foreign key (CALLERTYPEID) references caller_type (CALLERTYPEID)
create table advert (ADVERTID integer not null auto_increment, NAME varchar(255), DISPLAYORDER integer, primary key (ADVERTID)) engine=InnoDB
create table agency (AGENCYID integer not null auto_increment, NAME varchar(255), primary key (AGENCYID)) engine=InnoDB
create table caller_type (CALLERTYPEID integer not null auto_increment, NAME varchar(255), DISPLAYORDER integer, primary key (CALLERTYPEID)) engine=InnoDB
create table person (PERSONID integer not null auto_increment, CREATEDON datetime(6), WEBACCOUNTCREATIONDATE datetime(6), WEBLASTVISIT datetime(6), EMAIL varchar(255), ACTIVERECORD bit, DELETED bit, INITIALS varchar(255) not null, WEBACCOUNTNAME varchar(255), WEBACCOUNTPASSWORD varchar(255), NBOFLOGIN integer, LASTNAME varchar(255), FIRSTNAME varchar(255), primary key (PERSONID)) engine=InnoDB
create table phone_call (PHONECALLID integer not null auto_increment, COLOURCODE varchar(255) not null, POSTCODE varchar(5) not null, RECEIVEDON datetime(6), EMAIL varchar(255) not null, ACKNOWLEDGED bit, DELETED bit, COMPLETE bit, ADDRESSLINE1 varchar(255) not null, MOBILENUMBER varchar(255) not null, LASTNAME varchar(255) not null, MANDATENAME varchar(255) not null, OBJECT longtext not null, FIRSTNAME varchar(255) not null, FOLLOWUP longtext, PHONENUMBER varchar(255), CALLTYPE varchar(255) not null, TOWN varchar(255) not null, AGENCYID integer not null, ADVERTID integer, APPROVEDBY integer, NEGOCIATOR integer, SOURCEID integer, RECEIVEDBY integer not null, FOLLOWEDBY integer, FOLLOWEDBY2 integer, FOLLOWEDBY3 integer, CALLERTYPEID integer not null, primary key (PHONECALLID)) engine=InnoDB
create table source (SOURCEID integer not null auto_increment, NAME varchar(255), DISPLAYORDER integer, primary key (SOURCEID)) engine=InnoDB
alter table person add constraint UK_jnmhkxs5tdukd3cpw93aop3vr unique (EMAIL)
alter table phone_call add constraint UK_b4im4hxwcn3mv2d5yhuld6sf6 unique (EMAIL)
alter table phone_call add constraint FK9ya9u2rigmpcsyk5es4lkm2mp foreign key (AGENCYID) references agency (AGENCYID)
alter table phone_call add constraint FK8na4ciydmxlw62ywiv08m9qfj foreign key (ADVERTID) references advert (ADVERTID)
alter table phone_call add constraint FKp1rwytv5b48icku06ypcemso3 foreign key (APPROVEDBY) references person (PERSONID)
alter table phone_call add constraint FKgi6h6i88i02wdw5ry7pbk28o5 foreign key (NEGOCIATOR) references person (PERSONID)
alter table phone_call add constraint FKp9lf1j7n49pqv9ie08tnhn7h1 foreign key (SOURCEID) references source (SOURCEID)
alter table phone_call add constraint FKnixnm4ik6rh83uqe1vu0osrr8 foreign key (RECEIVEDBY) references person (PERSONID)
alter table phone_call add constraint FK154cyobibs1wbmfpaj4y25wc9 foreign key (FOLLOWEDBY) references person (PERSONID)
alter table phone_call add constraint FKlt1bqtnsejywtr1wrbfa0vogi foreign key (FOLLOWEDBY2) references person (PERSONID)
alter table phone_call add constraint FK7f427a791ehxrmcj6of898oxd foreign key (FOLLOWEDBY3) references person (PERSONID)
alter table phone_call add constraint FK8kirfcxapvdpnrsfedorandrj foreign key (CALLERTYPEID) references caller_type (CALLERTYPEID)
create table advert (ADVERTID integer not null auto_increment, NAME varchar(255), DISPLAYORDER integer, primary key (ADVERTID)) engine=InnoDB
create table agency (AGENCYID integer not null auto_increment, NAME varchar(255), primary key (AGENCYID)) engine=InnoDB
create table caller_type (CALLERTYPEID integer not null auto_increment, NAME varchar(255), DISPLAYORDER integer, primary key (CALLERTYPEID)) engine=InnoDB
create table person (PERSONID integer not null auto_increment, CREATEDON datetime(6), WEBACCOUNTCREATIONDATE datetime(6), WEBLASTVISIT datetime(6), EMAIL varchar(255), ACTIVERECORD bit, DELETED bit, INITIALS varchar(255) not null, WEBACCOUNTNAME varchar(255), WEBACCOUNTPASSWORD varchar(255), NBOFLOGIN integer, LASTNAME varchar(255), FIRSTNAME varchar(255), primary key (PERSONID)) engine=InnoDB
create table phone_call (PHONECALLID integer not null auto_increment, COLOURCODE varchar(255) not null, POSTCODE varchar(5) not null, RECEIVEDON datetime(6), EMAIL varchar(255) not null, ACKNOWLEDGED bit, DELETED bit, COMPLETE bit, ADDRESSLINE1 varchar(255) not null, MOBILENUMBER varchar(255) not null, LASTNAME varchar(255) not null, MANDATENAME varchar(255) not null, OBJECT longtext not null, FIRSTNAME varchar(255) not null, FOLLOWUP longtext, PHONENUMBER varchar(255), CALLTYPE varchar(255) not null, TOWN varchar(255) not null, AGENCYID integer not null, ADVERTID integer, APPROVEDBY integer, NEGOCIATOR integer, SOURCEID integer, RECEIVEDBY integer not null, FOLLOWEDBY integer, FOLLOWEDBY2 integer, FOLLOWEDBY3 integer, CALLERTYPEID integer not null, primary key (PHONECALLID)) engine=InnoDB
create table source (SOURCEID integer not null auto_increment, NAME varchar(255), DISPLAYORDER integer, primary key (SOURCEID)) engine=InnoDB
alter table person add constraint UK_jnmhkxs5tdukd3cpw93aop3vr unique (EMAIL)
alter table phone_call add constraint UK_b4im4hxwcn3mv2d5yhuld6sf6 unique (EMAIL)
alter table phone_call add constraint FK9ya9u2rigmpcsyk5es4lkm2mp foreign key (AGENCYID) references agency (AGENCYID)
alter table phone_call add constraint FK8na4ciydmxlw62ywiv08m9qfj foreign key (ADVERTID) references advert (ADVERTID)
alter table phone_call add constraint FKp1rwytv5b48icku06ypcemso3 foreign key (APPROVEDBY) references person (PERSONID)
alter table phone_call add constraint FKgi6h6i88i02wdw5ry7pbk28o5 foreign key (NEGOCIATOR) references person (PERSONID)
alter table phone_call add constraint FKp9lf1j7n49pqv9ie08tnhn7h1 foreign key (SOURCEID) references source (SOURCEID)
alter table phone_call add constraint FKnixnm4ik6rh83uqe1vu0osrr8 foreign key (RECEIVEDBY) references person (PERSONID)
alter table phone_call add constraint FK154cyobibs1wbmfpaj4y25wc9 foreign key (FOLLOWEDBY) references person (PERSONID)
alter table phone_call add constraint FKlt1bqtnsejywtr1wrbfa0vogi foreign key (FOLLOWEDBY2) references person (PERSONID)
alter table phone_call add constraint FK7f427a791ehxrmcj6of898oxd foreign key (FOLLOWEDBY3) references person (PERSONID)
alter table phone_call add constraint FK8kirfcxapvdpnrsfedorandrj foreign key (CALLERTYPEID) references caller_type (CALLERTYPEID)
