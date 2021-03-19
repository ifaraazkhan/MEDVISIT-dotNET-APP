<%@ Page Title="Calendar" Language="C#" MasterPageFile="~/Site.Master" AutoEventWireup="true" CodeBehind="calendar.aspx.cs" Inherits="MD_Clinic.calendar" %>
<asp:Content ID="Content2" runat="server" contentplaceholderid="ContentPlace_breadcrumb">
                <!-- Breadcrumb -->
			<div class="breadcrumb-bar">
				<div class="container-fluid">
					<div class="row align-items-center">
						<div class="col-md-12 col-12">
							
							<h2 class="breadcrumb-title">Calendar</h2>
						</div>
					</div>
				</div>
			</div>
			<!-- /Breadcrumb -->
            </asp:Content>

<asp:Content ID="Content3" runat="server" contentplaceholderid="ContentPlaceHolder_mainArea">
    <div class="col-md-7 col-lg-8 col-xl-9">
       
        <asp:UpdatePanel ID="UpdatePanel1" runat="server">

        <ContentTemplate>
							<div class="row">
								<div class="col-md-12">
									<div class="row">
										<div class="col-12 col-sm-4 col-md-6">
											<h4 class="mb-1">
                                                <asp:Label ID="lbl_today_date" runat="server" Text=""></asp:Label></h4>
											<p class="text-muted">
                                                <asp:Label ID="lbl_today_day" runat="server" Text=""></asp:Label></p>
										</div>
										<div class="col-12 col-sm-8 col-md-6 text-sm-right">
											<div class="bookingrange btn btn-white btn-sm mb-3">
												<i class="far fa-calendar-alt mr-2"></i>
												<span>February 17, 2021 - February 23, 2021</span>
												<i class="fas fa-chevron-down ml-2"></i>
											</div>
										</div>
									</div>
									<div class="card booking-schedule schedule-widget">
							
										<!-- Schedule Header -->
										<div class="schedule-header">
											<div class="row">
												<div class="col-md-12">
												
													<!-- Day Slot -->
                                                       <asp:ListView ID="ListView_Days" runat="server" ItemPlaceholderID="itemPlaceHolder1" 
                                                           OnItemDataBound="ListView_Days_ItemDataBound" OnItemCommand="ListView_Days_ItemCommand" DataKeyNames="id" >

                               <LayoutTemplate>
                                  <div class="day-slot">

									<ul>
                                        	<li class="left-arrow">
																<a href="">
																	<i class="fa fa-chevron-left"></i>
																</a>
											</li>
                                     <asp:PlaceHolder runat="server" ID="itemPlaceHolder1"></asp:PlaceHolder>
                                   <li class="right-arrow">
																<a href="">
																	<i class="fa fa-chevron-right"></i>
																</a>
															</li>
														</ul>
													</div>
                               </LayoutTemplate>

					           <ItemTemplate>
                              <li>
																<span><%# Eval("day")%></span>
																<span class="slot-date">
                                                                    <asp:Label ID="lbl_date" runat="server" Text='<%# Eval("date")%>'></asp:Label>
                                                                 

																</span>
                                  <asp:Button ID="btn_working" runat="server" Text='<%# Eval("status")%>' class="btn btn-sm bg-success-light" data-toggle="tooltip" data-placement="bottom" title="change to non-working" 
                                      CommandName="Status_Add" CommandArgument='<%# DataBinder.Eval(Container.DataItem, "id") %>' onclientclick="javascript:return confirm('Are you sure to change status?')" />
							      
                                  <asp:Button ID="btn_nonWorking" Visible="false" runat="server" Text='<%# Eval("status")%>' class="btn btn-sm bg-danger-light" data-toggle="tooltip" data-placement="bottom" title="change to working" 
                                      CommandName="Status_Delete" CommandArgument='<%# DataBinder.Eval(Container.DataItem, "id") %>' onclientclick="javascript:return confirm('Are you sure to change status?')" />
																
								</li>
								 </ItemTemplate>
			
                            </asp:ListView>					
														
															
															
															
													<!-- /Day Slot -->
													
												</div>
											</div>
										</div>
										<!-- /Schedule Header -->
										
										<!-- Schedule Content -->
										<div class="schedule-cont">
											<div class="row">
												<div class="col-md-12">
												
													<!-- Time Slot -->
                                                 
                                                            	<div class="time-slot">
	                                                             <ul class="clearfix">
                                                                     <li>
                                                                          <asp:Repeater runat="server" ID="rptSection1" OnItemDataBound="rptSection1_ItemDataBound" OnItemCommand="rptSection1_ItemCommand">
                    <ItemTemplate>
                        <asp:Button ID="btn_available1" runat="server"  Text='<%# String.Format("{0} - {1}", Eval("start_time"), Eval("end_time")) %>' 
                        class="timing bg-success-light" CommandName="un_available" CommandArgument = '<%# String.Format("{0} - {1}", Eval("start_time"), Eval("end_time")) %>'/>
                       <asp:Button ID="btn_unavailable1" runat="server"  Text='<%# String.Format("{0} - {1}", Eval("start_time"), Eval("end_time")) %>' 
                        class="timing bg-danger-light" CommandName="_available" CommandArgument = '<%# String.Format("{0} - {1}", Eval("start_time"), Eval("end_time")) %>' Visible="false"/>
                      
                       
                    </ItemTemplate>
                </asp:Repeater>
                                                                     </li>
                                                                     <li>
                                                                          <asp:Repeater runat="server" ID="rptSection2" OnItemDataBound="rptSection2_ItemDataBound" OnItemCommand="rptSection2_ItemCommand">
                    <ItemTemplate>
                        <asp:Button ID="btn_available1" runat="server"  Text='<%# String.Format("{0} - {1}", Eval("start_time"), Eval("end_time")) %>' 
                        class="timing bg-success-light" CommandName="un_available" CommandArgument = '<%# String.Format("{0} - {1}", Eval("start_time"), Eval("end_time")) %>'/>
                       <asp:Button ID="btn_unavailable1" runat="server"  Text='<%# String.Format("{0} - {1}", Eval("start_time"), Eval("end_time")) %>' 
                        class="timing bg-danger-light" CommandName="_available" CommandArgument = '<%# String.Format("{0} - {1}", Eval("start_time"), Eval("end_time")) %>' Visible="false"/>
                      
                       
                    </ItemTemplate>
                </asp:Repeater>
                                                                     </li>

                                                                        <li>
                                                                          <asp:Repeater runat="server" ID="rptSection3" OnItemDataBound="rptSection3_ItemDataBound" OnItemCommand="rptSection3_ItemCommand">
                    <ItemTemplate>
                        <asp:Button ID="btn_available1" runat="server"  Text='<%# String.Format("{0} - {1}", Eval("start_time"), Eval("end_time")) %>' 
                        class="timing bg-success-light" CommandName="un_available" CommandArgument = '<%# String.Format("{0} - {1}", Eval("start_time"), Eval("end_time")) %>'/>
                       <asp:Button ID="btn_unavailable1" runat="server"  Text='<%# String.Format("{0} - {1}", Eval("start_time"), Eval("end_time")) %>' 
                        class="timing bg-danger-light" CommandName="_available" CommandArgument = '<%# String.Format("{0} - {1}", Eval("start_time"), Eval("end_time")) %>' Visible="false"/>
                      
                       
                    </ItemTemplate>
                </asp:Repeater>
                                                                     </li>

                                                                      <li>
                                                                          <asp:Repeater runat="server" ID="rptSection4" OnItemDataBound="rptSection4_ItemDataBound" OnItemCommand="rptSection4_ItemCommand">
                    <ItemTemplate>
                        <asp:Button ID="btn_available1" runat="server"  Text='<%# String.Format("{0} - {1}", Eval("start_time"), Eval("end_time")) %>' 
                        class="timing bg-success-light" CommandName="un_available" CommandArgument = '<%# String.Format("{0} - {1}", Eval("start_time"), Eval("end_time")) %>'/>
                       <asp:Button ID="btn_unavailable1" runat="server"  Text='<%# String.Format("{0} - {1}", Eval("start_time"), Eval("end_time")) %>' 
                        class="timing bg-danger-light" CommandName="_available" CommandArgument = '<%# String.Format("{0} - {1}", Eval("start_time"), Eval("end_time")) %>' Visible="false"/>
                      
                       
                    </ItemTemplate>
                </asp:Repeater>
                                                                     </li>

                                                                      <li>
                                                                          <asp:Repeater runat="server" ID="rptSection5" OnItemDataBound="rptSection5_ItemDataBound" OnItemCommand="rptSection5_ItemCommand">
                    <ItemTemplate>
                        <asp:Button ID="btn_available1" runat="server"  Text='<%# String.Format("{0} - {1}", Eval("start_time"), Eval("end_time")) %>' 
                        class="timing bg-success-light" CommandName="un_available" CommandArgument = '<%# String.Format("{0} - {1}", Eval("start_time"), Eval("end_time")) %>'/>
                       <asp:Button ID="btn_unavailable1" runat="server"  Text='<%# String.Format("{0} - {1}", Eval("start_time"), Eval("end_time")) %>' 
                        class="timing bg-danger-light" CommandName="_available" CommandArgument = '<%# String.Format("{0} - {1}", Eval("start_time"), Eval("end_time")) %>' Visible="false"/>
                      
                       
                    </ItemTemplate>
                </asp:Repeater>
                                                                     </li>
                                                                     <li>
                                                                          <asp:Repeater runat="server" ID="rptSection6" OnItemDataBound="rptSection6_ItemDataBound" OnItemCommand="rptSection6_ItemCommand">
                    <ItemTemplate>
                        <asp:Button ID="btn_available1" runat="server"  Text='<%# String.Format("{0} - {1}", Eval("start_time"), Eval("end_time")) %>' 
                        class="timing bg-success-light" CommandName="un_available" CommandArgument = '<%# String.Format("{0} - {1}", Eval("start_time"), Eval("end_time")) %>'/>
                       <asp:Button ID="btn_unavailable1" runat="server"  Text='<%# String.Format("{0} - {1}", Eval("start_time"), Eval("end_time")) %>' 
                        class="timing bg-danger-light" CommandName="_available" CommandArgument = '<%# String.Format("{0} - {1}", Eval("start_time"), Eval("end_time")) %>' Visible="false"/>
                      
                       
                    </ItemTemplate>
                </asp:Repeater>
                                                                     </li>
                                                                       <li>
                                                                          <asp:Repeater runat="server" ID="rptSection7" OnItemDataBound="rptSection7_ItemDataBound" OnItemCommand="rptSection7_ItemCommand">
                    <ItemTemplate>
                        <asp:Button ID="btn_available1" runat="server"  Text='<%# String.Format("{0} - {1}", Eval("start_time"), Eval("end_time")) %>' 
                        class="timing bg-success-light" CommandName="un_available" CommandArgument = '<%# String.Format("{0} - {1}", Eval("start_time"), Eval("end_time")) %>'/>
                       <asp:Button ID="btn_unavailable1" runat="server"  Text='<%# String.Format("{0} - {1}", Eval("start_time"), Eval("end_time")) %>' 
                        class="timing bg-danger-light" CommandName="_available" CommandArgument = '<%# String.Format("{0} - {1}", Eval("start_time"), Eval("end_time")) %>' Visible="false"/>
                      
                       
                    </ItemTemplate>
                </asp:Repeater>
                                                                     </li>
                                                                     
                                                                 </ul>
                                                                </div>

                                                       
                
             
           
												
														
													
													<!-- /Time Slot -->
													<hr/>
													<div class="row form-row">
														
														<div class="col-md-3">
															<div class="form-group">
																
																<button type="submit" class="btn btn-primary">Save this as template</button>
															</div>
														</div>
														<div class="col-md-1">
															<div class="form-group">
																
																
															</div>
														</div>
														<div class="col-md-2">
															<div class="form-group">
																<select class="form-control" tabindex="-1" aria-hidden="true" style="width:150px; margin-left:10px; min-height: 10px;font-size: 14px;">
																	<option data-select2-id="3">Select</option>
																	<option>Template-1</option>
																	<option>Template-2</option>
																	<option>Template-3</option>
																</select>
																
															</div>
														</div>
														<div class="col-md-2">
															<div class="form-group">
																
																<select class="form-control" tabindex="-1" aria-hidden="true" style="width:150px; margin-left:10px; min-height: 10px;font-size: 14px;">
																	<option data-select2-id="3">Choose Duration</option>
																	<option>For Current Week only</option>
																	<option>For 2 weeks</option>
																	<option>For 3 weeks </option>
																	<option>For 4 weeks </option>
																	<option>For 8 weeks </option>
																</select>
																
															</div>
														</div>
														<div class="col-md-4">
															<div class="appointment-action">
																<a href="#" style="font-size: 18px;" class="btn btn-sm bg-info-light" data-toggle="modal" data-target="#appt_details">
																	<i class="fas fa-calendar-alt"></i> Apply & Publish Calendar
																</a>
																
																<!-- <a href="javascript:void(0);" style="font-size: 18px;" class="btn btn-sm bg-warning-light">
																	<i class="fas fa-check"></i> update
																</a> -->
																<!-- <a href="javascript:void(0);" style="font-size: 18px;" class="btn btn-sm bg-danger-light">
																	<i class="fas fa-trash"></i> 
																</a> -->
															</div>
														</div>
												
														
														
													</div>
												</div>
											</div>
										</div>
										<!-- /Schedule Content -->
										
									</div>
								</div>
							</div>
            </ContentTemplate>
            </asp:UpdatePanel>
						</div>
</asp:Content>


