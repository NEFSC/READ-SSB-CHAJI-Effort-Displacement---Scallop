# A place to store your username and password.  
# To use this:
#    make a copy of this file.
#    Name the copy "R_credentials.R"
#    Place it in your root directory.  
#    Fill in your oracle_username, oracle_password.  

#  Depending on how the rest of your system is configured, you may find it useful to fill in the rest of the connection details here (like the path to the server, port, ssid).





oracle_server = "sole"

oracle_username<-"<yourid>"
oracle_password<-"<yoursole_pwd>"
novapw<-"<yournova_pwd"



drv<-dbDriver("Oracle")
shost <- "<sole.full.path.to.server.gov>"
port <- port_number_here
ssid <- "<ssid_here>"

sole.connect.string<-paste(
  "(DESCRIPTION=",
  "(ADDRESS=(PROTOCOL=tcp)(HOST=", shost, ")(PORT=", port, "))",
  "(CONNECT_DATA=(SID=", ssid, ")))", sep="")


# Don't run this here.  You should put it in where you make the query and then close it when you are done with dbDisconnect(sole_conn)
# sole_conn<-dbConnect(drv, oracle_username, password=oracle_password, dbname=sole.connect.string)



nhost <- "nova.full.path.to.server.gov"
port <- port_number_here
ssid2 <- "<nova"

nova.connect.string<-paste(
  "(DESCRIPTION=",
  "(ADDRESS=(PROTOCOL=tcp)(HOST=", nhost, ")(PORT=", port, "))",
  "(CONNECT_DATA=(SID=", ssid2, ")))", sep="")

# Don't run this here.  You should put it in where you make the query and then close it when you are done with dbDisconnect(nova_conn)
# nova_conn<-dbConnect(drv, oracle_username, password=oracle_password, dbname=nova.connect.string)
