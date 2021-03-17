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
                                                <asp:TextBox ID="txt_start_tme" runat="server" class="form-control" type="time" name="time"></asp:TextBox>
                                              
											</div>
										</div>
										<div class="col-md-4">
											<div class="form-group">
												<label> End Time<span class="text-danger">*</span></label>
												 <asp:TextBox ID="txt_end_time" runat="server" class="form-control" type="time" name="time"></asp:TextBox>
											</div>
										</div>
										<div class="col-md-4">
											<div class="form-group">
												<label>Slot Duration</label>
                                                <asp:DropDownList ID="ddl_slot_time" runat="server" class="form-control select select2-hidden-accessible" data-select2-id="1" tabindex="-1" aria-hidden="true">
                                                    <asp:ListItem Value="0">-Select-</asp:ListItem>
                                                    <asp:ListItem Value="15">15 min</asp:ListItem>
                                                    <asp:ListItem Value="30">30 min</asp:ListItem>
                                                    <asp:ListItem Value="45">45 min</asp:ListItem>
                                                    <asp:ListItem Value="60">60 min (1hr)</asp:ListItem>

                                                </asp:DropDownList>
												
											</div>
										</div>
										<div class="col-md-4">
											<div class="form-group">
                                                <asp:Button ID="btn_setting_slot" runat="server" Text="Update" class="btn btn-primary" OnClick="btn_setting_slot_Click" />
                                                <asp:Button ID="btn_edit" runat="server" Text="Edit" class="btn btn-warning" OnClick="btn_edit_Click" Visible="false"/>
												
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
                                                <asp:TextBox ID="txt_password" runat="server" CssClass="form-control" TextMode="Password" ></asp:TextBox>
											</div>
										</div>
										<div class="col-md-4">
											<div class="form-group">
												<label> New Password<span class="text-danger">*</span></label>
											 <asp:TextBox ID="txt_NewPassword" runat="server" CssClass="form-control" TextMode="Password" ></asp:TextBox>
                                                <asp:RegularExpressionValidator Display = "Dynamic" ControlToValidate = "txt_NewPassword" ID="RegularExpressionValidator3" ValidationExpression = "^[\s\S]{5,8}$" runat="server" ErrorMessage="Minimum 5 and Maximum 16 characters required."></asp:RegularExpressionValidator>
											</div>
										</div>
										<div class="col-md-4">
											<div class="form-group">
												<label> Confirm Password<span class="text-danger">*</span></label>
												 <asp:TextBox ID="txt_ConfirmPass" runat="server" CssClass="form-control" TextMode="Password" ></asp:TextBox>
                                                 <asp:RegularExpressionValidator Display = "Dynamic" ControlToValidate = "txt_ConfirmPass" ID="RegularExpressionValidator1" ValidationExpression = "^[\s\S]{5,8}$" runat="server" ErrorMessage="Minimum 5 and Maximum 16 characters required."></asp:RegularExpressionValidator>
											</div>
										</div>
										<div class="col-md-4">
											<div class="form-group">
												
                                                <asp:Button ID="btn_changePassword" runat="server" Text="Change Password" class="btn btn-secondary" OnClick="btn_changePassword_Click"/>
											</div>
										</div>
										
									</div>
								</div>
							</div>
						</div>
   
</asp:Content>


