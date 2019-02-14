<%@ Page Language="C#" AutoEventWireup="true" CodeBehind="Home.aspx.cs" Inherits="Page.Home" %>

<!DOCTYPE html>

<html xmlns="http://www.w3.org/1999/xhtml">
<head runat="server">
    <meta http-equiv="Content-Type" content="text/html; charset=utf-8"/>
    <title>Job Test</title>
    <meta name="viewport" content="width=device-width, initial-scale=1" maximum-scale="1", user-scalable="no"/>
    <link href="css/Widgets.css" rel="stylesheet" type="text/css" />
    <link href="css/NewEmployee.css" rel="stylesheet" type="text/css" />
    <link href="css/CardFilter.css" rel="stylesheet" type="text/css" />
    <link rel="stylesheet" href="https://maxcdn.bootstrapcdn.com/bootstrap/4.2.1/css/bootstrap.min.css" />
    <link rel="stylesheet" href="https://use.fontawesome.com/releases/v5.7.1/css/all.css" />
    
</head>
<body class="skin-blue">
    <form id="form1" runat="server">
        <!-- //////////////////////////////////////////////////////////// Spinner Loading ///////////////////////////////////////////////////////////// -->
        <div class="spinner-border text-primary mx-auto loading" id="spinnerLoading" role="status">
            <span class="sr-only">Loading...</span>
        </div>
        <!-- //////////////////////////////////////////////////////////// Search Error Alert ///////////////////////////////////////////////////////////// -->
        <div class="alert alert-danger w-75 mx-auto searchAlert" role="alert">
          No data recorded - Try inserting other code
        </div>
        <!-- //////////////////////////////////////////////////////////// Header and Table ///////////////////////////////////////////////////////////// -->
        <div class="container">
            <div class="d-flex">
                <div class="input-group-btn p-2">
                    <button type="button" id="newButton" class="btn btn-primary">New</button>
                </div>
            
                <div class="input-group p-2 justify-content-end">
                    <div class="input-group-btn">
                        <button class="btn btn-default" id="filterButton" type="button"><span class="fas fa-filter"></span></button>
                    </div>
                        <div class="col-xs-2">
                        <input class="form-control sm-10" placeholder="Search" name="srchInput" id="srchInput" value=""  type="text" />
                    </div>
                    <div class="input-group-btn">
                        <button id="searchButton" class="btn btn-default" type="button"><span class="fas fa-search"></span></button>
                    </div>                
                </div>
            </div>

            <div>
                <table class="table table-sm tableEmployee" id="mainTable">
                        <thead class="table-primary">
                            <tr>
                                <th>Code</th>
                                <th>Name</th>
                                <th>SAM</th>
                                <th>Country</th>
                                <th>Active</th>
                                <th>Edit</th>
                            </tr>
                        </thead>
                        <tbody></tbody>
                </table>
            </div>
        </div>
        <!-- //////////////////////////////////////////////////////////// Container New ///////////////////////////////////////////////////////////// -->
        <div class="" id="newEmployee">
            <div class="container position-absolute mx-auto " id="containerNew">
                <div class="alert alert-success w-75 mx-auto" id="divSuccess"  role="alert">
                    The employee has been inserted
                </div>

                <div class="alert alert-danger w-75 mx-auto" id="insertError" role="alert">
                  An error ocurred on insertion!
                </div>
              <!-- //////////////////////////////////////////////////////////// Header ///////////////////////////////////////////////////////////// -->
                <div class="row pb-2 pt-2">
                    <div class="col-4">
                        <div class="input-group-btn">
                            <button class="btn btn-default font-weight-bold bg-light border-secondary" id="backButton" type="button">
                                <span class="fas fa-long-arrow-alt-left mr-1 text-danger">
                                </span>
                                Back
                            </button>
                        </div>
                    </div>
                    <div class="col-5">
                        <div class="input-group-btn p-2">
                            <h5 class="mb-0">User Information</h5>
                        </div>
                    </div>
                          
                    <div class="column justify-content-end">       
                        <select class="form-control selectAction" id="selectAction">
                            <option>Save</option>
                            <option>Delete</option>
                        </select> 
                    </div>

                    <div class="column">
                        <div class="input-group-btn">
                            <button class="btn btn-default font-weight-bold bg-light border" type="submit" id="submitButton">
                                <span class="fas fa-check text-success"></span>
                            </button>
                            <button class="btn btn-default font-weight-bold bg-light border" type="button" id="editButton">
                                <span class="fas fa-edit text-success"></span>
                            </button>
                        </div>
                    </div>
               
                </div>
              <!-- //////////////////////////////////////////////////////////// Form Fields ///////////////////////////////////////////////////////////// -->
        
                <div class="form-group row border-top border-primary bg-light pt-2">
                        <div class="form-group">
                            <label for="inputCode" class="row-sm-2 row-form-label font-weight-bold ml-4">Employee ID(*):</label>
                                <div class="col-sm-10 d-flex">
                                    <button id="codeButton" class="btn btn-default codeButton " type="button"><span class="fas fa-search"></span></button>
                                    <input type="number" class="form-control" id="inputCode" name="inputCode" required="required" />
                                </div>
                            <small class="isvalid col-sm-10 valid-feedback" id="messageDelete">Please, insert a code for delete (*)!</small>
                            <small class="isvalid col-sm-10 invalid-feedback" id="message">Please fill out all required fields (*)!</small>
                        </div>
                
                    <div class="form-group col-3">
                        <label for="country" class="row-sm-2 row-form-label font-weight-bold ml-4">Country:</label>
                        <div class="form-group">
                            <select class="form-control country" id="country" name="country" runat="server">
                                <option>Argentina</option>
                                <option>Brazil</option>
                                <option>Colombia</option>
                            </select>
                        </div>
                    </div>

                    <div class="form-group ml-5">
                        <label for="inputSam" class="row-sm-2 row-form-label font-weight-bold ml-4">SAM Account(*):</label>
                        <div class="col-sm-10">
                            <input type="text" class="form-control inputSam" id="inputSam" name="inputSam" required="required" />
                        </div>
                    </div>
                </div>

                <div class="row bg-light">
                    <div class="col">
                        <div class="form-group">
                            <label for="inputName" class=" font-weight-bold">First Name:</label>
                            <input type="text" class="form-control inputName" id="inputName" name="inputName" />
                        </div>
                    </div>
            
                    <div class="col">
                        <div class="form-group">
                            <label for="inputLast" class="font-weight-bold">Last Name:</label>
                            <input type="text" class="form-control inputLast" id="inputLast" name="inputLast"  />
                        </div>
                    </div>           
                </div>
            
                <div class="row bg-light border-bottom border-primary">
                    <div class="col">
                        <div class="form-group w-50">
                            <label for="inputEmail" class="font-weight-bold">Email:</label>
                            <input type="email" class="form-control inputEmail" id="inputEmail" name="inputEmail" />
                        </div>
                    </div>
                </div>
            <!-- //////////////////////////////////////////////////////////// Footer Fields ///////////////////////////////////////////////////////////// -->
                <div class="row w-50 ">
                    <div class="col" >
                        <div class="form-group">
                            <label for="inputID" class=" font-weight-bold">Active:</label>                       
                            <select class="form-control inputActive" id="inputActive" name="inputActive" runat="server">
                                <option>Yes</option>
                                <option>No</option>
                            </select>                   
                        </div>
                    </div>
            
                    <div class="col">
                        <div class="form-group">
                            <label for="inputName" class="font-weight-bold">System Administrator:</label>
                            <select class="form-control inputSystem" id="inputSystem" name="inputSystem" runat="server">
                                <option>No</option>
                                <option>Yes</option>
                            </select> 
                        </div>
                    </div>           
                </div>        
            </div>
        </div>

        <!-- //////////////////////////////////////////////////////////// Card Filter ///////////////////////////////////////////////////////////// -->
        <div  id="containerFilter">
            <div class=" card position-absolute w-75 container" id="cardFilter">
                <div class="card-header">
                    <h5 class="mb-0">Filter</h5>
                </div>
                <div class="form-group row mt-3">
                    <label for="inputID" class="col-sm-2 col-form-label font-weight-bold">Employee ID:</label>
                    <div class="col-sm-8">
                        <input type="number" class="form-control" id="inputIDFilter" name="inputIDFilter"/>
                    </div>
                </div>
                <div class="form-group row">
                    <label for="inputName" class="col-sm-2 col-form-label font-weight-bold">Name:</label>
                    <div class="col-sm-8">
                        <input type="text" class="form-control" id="inputNameFilter" name="inputNameFilter"/>
                    </div>
                </div>
                <div class="form-group row">
                    <label for="inputSAMFilter" class="col-sm-3 col-form-label font-weight-bold">SAM Account:</label>
                    <div class="col-sm-7">
                        <input type="text" class="form-control" id="inputSamFilter" name="inputSamFilter"/>
                    </div>
                </div>
                <div class="form-group row">
                    <label for="countryFilter" class="col-sm-2 col-form-label font-weight-bold">Country:</label>
                    <div class="col-sm-6">
                    <select class="form-control" id="countryFilter" name="countryFilter">
                        <option value="">All</option>
                        <option>Argentina</option>
                        <option>Brazil</option>
                        <option>Colombia</option>
                    </select>
                    </div>
                </div>
                <div class="form-group row">
                    <label for="activeFilter" class="col-sm-2 col-form-label font-weight-bold">Active:</label>
                    <div class="col-sm-3">
                    <select class="form-control" id="activeFilter" name="activeFilter">
                        <option value="">All</option>
                        <option>Yes</option>
                        <option>No</option>
                    </select>
                    </div>
                </div>
                <div class="input-group p-2 justify-content-end">
                    <div class="input-group-btn ">
                        <button class="btn btn-secondary" id="cancelButton" type="button">Cancel Filter</button>
                    </div>
                    <div class="input-group-btn ml-2">
                        <button class="btn btn-primary" id="filterSuccess" type="button">OK</button>
                    </div>
                </div>
            </div>
        </div>
    </form>
</body>
<script src="https://ajax.googleapis.com/ajax/libs/jquery/3.3.1/jquery.min.js"></script>
<script src="https://cdnjs.cloudflare.com/ajax/libs/popper.js/1.14.6/umd/popper.min.js"></script>
<script src="https://maxcdn.bootstrapcdn.com/bootstrap/4.2.1/js/bootstrap.min.js"></script>
<script src="js/SearchCode.js"></script>
<script src="js/InitialSearch.js"></script>
<script src="js/NewEmployee.js"></script>
<script src="js/DeleteEmployee.js"></script>
<script src="js/FilterEmployee.js"></script>
<script src="js/UpdateEmployee.js"></script>
</html>
