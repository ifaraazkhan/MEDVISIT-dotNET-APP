<%@ Page Title="Profile" Language="C#" MasterPageFile="~/Site.Master" AutoEventWireup="true" CodeBehind="Profile.aspx.cs" Inherits="MD_Clinic.Profile" %>
<asp:Content ID="Content4" runat="server" contentplaceholderid="ContentPlace_breadcrumb">
                <!-- Breadcrumb -->
			<div class="breadcrumb-bar">
				<div class="container-fluid">
					<div class="row align-items-center">
						<div class="col-md-12 col-12">
							
							<h2 class="breadcrumb-title">Profile</h2>
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
									<h4 class="card-title">Basic Information</h4>
									<div class="row form-row">
										
										<div class="col-md-6">
											<div class="form-group">
												<label>Email ID </label>
                                                <asp:TextBox ID="txt_email" runat="server" class="form-control" readonly=""></asp:TextBox>
												
											</div>
										</div>
										<div class="col-md-6">
											<div class="form-group">
												<label>Mobile Number </label>
											    <asp:TextBox ID="txt_mobile" runat="server" class="form-control" readonly=""></asp:TextBox>
											</div>
										</div>
										<div class="col-md-6">
											<div class="form-group">
												<label>Name </label>
												 <asp:TextBox ID="txt_name" runat="server" class="form-control"></asp:TextBox>
											</div>
										</div>
										
										<div class="col-md-6">
											<div class="form-group">
												<label>Practicing since</label>
											 <asp:TextBox ID="txt_practice" runat="server" class="form-control"></asp:TextBox>
											</div>
										</div>
									<div class="col-md-12">
											<div class="form-group">
												<label>Profile Description</label>
												 <asp:TextBox ID="txt_description" runat="server" class="form-control" TextMode="MultiLine" Rows="5"></asp:TextBox>
											</div>
										</div>
                                       	<div class="add-more">
										 <asp:Button ID="btn_update_profile" runat="server" Text="Update" class="btn btn-primary" />
									</div>
									</div>
								</div>
							</div>
							<div class="card">
								<div class="card-body">
									<h4 class="card-title">Education</h4>
									<div class="education-info">
										<div class="row form-row education-cont">
											<div class="col-12 col-md-10 col-lg-11">
												<div class="row form-row">
													<div class="col-12 col-md-6 col-lg-4">
														<div class="form-group">
															<label>Degree</label>
														 <asp:TextBox ID="txt_degree" runat="server" class="form-control"></asp:TextBox>
														</div> 
													</div>
													<div class="col-12 col-md-6 col-lg-4">
														<div class="form-group">
															<label>College/Institute</label>
															 <asp:TextBox ID="txt_college" runat="server" class="form-control"></asp:TextBox>
														</div> 
													</div>
													<div class="col-12 col-md-6 col-lg-4">
														<div class="form-group">
															<label>Year of Completion</label>
															 <asp:TextBox ID="txt_year" runat="server" class="form-control"></asp:TextBox>
														</div> 
													</div>
                                                    <div class="col-12 col-md-6 col-lg-4">
														<div class="form-group">
															<label>Certificate Names</label>
															 <asp:TextBox ID="txt_certificate" runat="server" class="form-control"></asp:TextBox>
														</div> 
													</div>
                                                      <%-- <div class="col-12 col-md-6 col-lg-4">
														<div class="form-group">
															<label>Specialization</label>
															 <asp:TextBox ID="txt_speciality" runat="server" class="form-control"></asp:TextBox>
														</div> 
													</div>--%>
                                                     
										</div>
												
											</div>
										</div>
									</div>
									<div class="add-more">
										 <asp:Button ID="Button2" runat="server" Text="Update" class="btn btn-primary" />
									</div>
								</div>
							</div>
						
    
    
    </div>
</asp:Content>

