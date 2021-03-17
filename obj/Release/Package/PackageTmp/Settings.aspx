<%@ Page Title="settings" Language="C#" MasterPageFile="~/Site.Master" AutoEventWireup="true" CodeBehind="Settings.aspx.cs" Inherits="MD_Clinic.Settings" %>
<asp:Content ID="Content4" runat="server" contentplaceholderid="ContentPlace_breadcrumb">
                <!-- Breadcrumb -->
			<div class="breadcrumb-bar">
				<div class="container-fluid">
					<div class="row align-items-center">
						<div class="col-md-12 col-12">
							
							<h2 class="breadcrumb-title">Settings</h2>
						</div>
					</div>
				</div>
			</div>
			<!-- /Breadcrumb -->
            </asp:Content>
<asp:Content ID="Content5" runat="server" contentplaceholderid="ContentPlaceHolder_mainArea">
    <div class="col-md-7 col-lg-8 col-xl-9">
							<div class="card">
								<div class="card-body">
									<h4 class="card-title">Basic Settings</h4>
									<div class="row form-row">
										
										<!-- <div class="col-md-4">
											<label>Choose Clinic</label>
												<select class="form-control select select2-hidden-accessible" data-select2-id="1" tabindex="-1" aria-hidden="true">
													<option data-select2-id="3">Select</option>
													<option>Clinic-1</option>
													<option>Clinic-2</option>
												</select>
										</div>
										<div class="col-md-8">
										</div> -->
										<div class="col-md-4">
											<div class="form-group">
												<label>Start Time <span class="text-danger">*</span></label>
												<input type="text" class="form-control" >
											</div>
										</div>
										<div class="col-md-4">
											<div class="form-group">
												<label> End Time<span class="text-danger">*</span></label>
												<input type="text" class="form-control">
											</div>
										</div>
										<div class="col-md-4">
											<div class="form-group">
												<label>Slot Duration</label>
												<select class="form-control select select2-hidden-accessible" data-select2-id="1" tabindex="-1" aria-hidden="true">
													<option data-select2-id="3">Select</option>
													<option>15 minutes</option>
													<option>30 minutes</option>
													<option>1 hour</option>
												</select>
											</div>
										</div>
										<div class="col-md-4">
											<div class="form-group">
												<button type="submit" class="btn btn-primary">Update</button>
											</div>
										</div>
										
									</div>
								</div>
							</div>
							<div class="card">
								<div class="card-body">
									<h4 class="card-title">Change Password</h4>
									<div class="row form-row">
										
										
										<div class="col-md-4">
											<div class="form-group">
												<label>Current Password <span class="text-danger">*</span></label>
												<input type="text" class="form-control" >
											</div>
										</div>
										<div class="col-md-4">
											<div class="form-group">
												<label> New Password<span class="text-danger">*</span></label>
												<input type="text" class="form-control">
											</div>
										</div>
										<div class="col-md-4">
											<div class="form-group">
												<label> Confirm Password<span class="text-danger">*</span></label>
												<input type="text" class="form-control">
											</div>
										</div>
										<div class="col-md-4">
											<div class="form-group">
												<button type="submit" class="btn btn-secondarygit ">Change Password</button>
											</div>
										</div>
										
									</div>
								</div>
							</div>
						</div>
</asp:Content>

