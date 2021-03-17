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

							
							<div class="row">
								<div class="col-md-12">
									<div class="row">
										<div class="col-12 col-sm-4 col-md-6">
											<h4 class="mb-1">11 November 2019</h4>
											<p class="text-muted">Monday</p>
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
													<div class="day-slot">
														<ul>
															<li class="left-arrow">
																<a href="">
																	<i class="fa fa-chevron-left"></i>
																</a>
															</li>
															<li>
																<span>Mon</span>
																<span class="slot-date">11 Nov <small class="slot-year">2019</small></span>
																<button type="submit" class="btn btn-sm bg-success-light" data-toggle="tooltip" data-placement="bottom" title="Change to Non-Working">Working</button>
													
																
															</span>
															</li>
															<li>
																<span>Tue</span>
																<span class="slot-date">12 Nov <small class="slot-year">2019</small></span>
																<button type="submit" class="btn btn-sm bg-default-light" data-toggle="tooltip" data-placement="bottom" 
																title="Make this Working" >Non-Working</button>
															</li>
															<li>
																<span>Wed</span>
																<span class="slot-date">13 Nov <small class="slot-year">2019</small></span>
																<button type="submit" class="btn btn-sm bg-default-light" data-toggle="tooltip" data-placement="bottom" 
																title="Make this Working" >Non-Working</button>
															</li>
															<li>
																<span>Thu</span>
																<span class="slot-date">14 Nov <small class="slot-year">2019</small></span>
																<button type="submit" class="btn btn-sm bg-default-light" data-toggle="tooltip" data-placement="bottom" 
																title="Make this Working" >Non-Working</button>
															</li>
															<li>
																<span>Fri</span>
																<span class="slot-date">15 Nov <small class="slot-year">2019</small></span>
																<button type="submit" class="btn btn-sm bg-default-light" data-toggle="tooltip" data-placement="bottom" 
																title="Make this Working" >Non-Working</button>
															</li>
															<li>
																<span>Sat</span>
																<span class="slot-date">16 Nov <small class="slot-year">2019</small></span>
																<button type="submit" class="btn btn-sm bg-default-light" data-toggle="tooltip" data-placement="bottom" 
																title="Make this Working" >Non-Working</button>
															</li>
															<li>
																<span>Sun</span>
																<span class="slot-date">17 Nov <small class="slot-year">2019</small></span>
																<button type="submit" class="btn btn-sm bg-default-light" data-toggle="tooltip" data-placement="bottom" 
																title="Make this Working" >Non-Working</button>
															</li>
															<li class="right-arrow">
																<a href="">
																	<i class="fa fa-chevron-right"></i>
																</a>
															</li>
														</ul>
													</div>
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
																
																<a class="timing bg-success-light" href="#">
																	<span>10:00 - 10:30</span> <span>AM</span>
																</a>
																<a class="timing" href="#">
																	<span>11:00 - 11:30</span> <span>AM</span>
																</a>
																<a class="timing" href="#">
																	<span>11:30 - 12:00</span> <span>AM</span>
																</a>
																<a class="timing" href="#">
																	<span>12:00 - 12:30</span> <span>PM</span>
																</a>
																<a class="timing" href="#">
																	<span>12:30 - 1:00</span> <span>PM</span>
																</a>
																<a class="timing" href="#">
																	<span>1:00 - 1:30</span> <span>PM</span>
																</a>
																<a class="timing bg-danger-light" href="#">
																	<span>1:30 - 2:00</span> <span>PM</span>
																</a>
																<a class="timing bg-danger-light" href="#">
																	<span>2:00 - 2:30</span> <span>PM</span>
																</a>
																<a class="timing" href="#">
																	<span>2:30 - 3:00</span> <span>PM</span>
																</a>
																<a class="timing" href="#">
																	<span>3:00 - 3:30</span> <span>PM</span>
																</a>
																<a class="timing" href="#">
																	<span>3:30 - 4:00</span> <span>PM</span>
																</a>
																<a class="timing bg-danger-light" href="#">
																	<span>4:00 - 4:30</span> <span>PM</span>
																</a>
																<a class="timing" href="#">
																	<span>4:30 - 5:00</span> <span>PM</span>
																</a>
															</li>
															<li>
																<a class="timing" href="#">
																	<span>9:00</span> <span>AM</span>
																</a>
																<a class="timing" href="#">
																	<span>10:00</span> <span>AM</span>
																</a>
																<a class="timing" href="#">
																	<span>11:00</span> <span>AM</span>
																</a>
															</li>
															<li>
																<a class="timing" href="#">
																	<span>9:00</span> <span>AM</span>
																</a>
																<a class="timing" href="#">
																	<span>10:00</span> <span>AM</span>
																</a>
																<a class="timing" href="#">
																	<span>11:00</span> <span>AM</span>
																</a>
															</li>
															<li>
																
																<a class="timing bg-success-light" href="#">
																	<span>10:00 - 10:30</span> <span>AM</span>
																</a>
																<a class="timing" href="#">
																	<span>11:00 - 11:30</span> <span>AM</span>
																</a>
																<a class="timing" href="#">
																	<span>11:30 - 12:00</span> <span>AM</span>
																</a>
																<a class="timing" href="#">
																	<span>12:00 - 12:30</span> <span>PM</span>
																</a>
																<a class="timing" href="#">
																	<span>12:30 - 1:00</span> <span>PM</span>
																</a>
																<a class="timing" href="#">
																	<span>1:00 - 1:30</span> <span>PM</span>
																</a>
																<a class="timing bg-danger-light" href="#">
																	<span>1:30 - 2:00</span> <span>PM</span>
																</a>
																<a class="timing bg-danger-light" href="#">
																	<span>2:00 - 2:30</span> <span>PM</span>
																</a>
																<a class="timing" href="#">
																	<span>2:30 - 3:00</span> <span>PM</span>
																</a>
																<a class="timing" href="#">
																	<span>3:00 - 3:30</span> <span>PM</span>
																</a>
																<a class="timing" href="#">
																	<span>3:30 - 4:00</span> <span>PM</span>
																</a>
																<a class="timing bg-danger-light" href="#">
																	<span>4:00 - 4:30</span> <span>PM</span>
																</a>
																<a class="timing" href="#">
																	<span>4:30 - 5:00</span> <span>PM</span>
																</a>
															</li>
															<li>
																<a class="timing" href="#">
																	<span>9:00</span> <span>AM</span>
																</a>
																<a class="timing selected" href="#">
																	<span>10:00</span> <span>AM</span>
																</a>
																<a class="timing" href="#">
																	<span>11:00</span> <span>AM</span>
																</a>
															</li>
															<li>
																<a class="timing" href="#">
																	<span>9:00</span> <span>AM</span>
																</a>
																<a class="timing" href="#">
																	<span>10:00</span> <span>AM</span>
																</a>
																<a class="timing" href="#">
																	<span>11:00</span> <span>AM</span>
																</a>
															</li>
															<li>
																<a class="timing" href="#">
																	<span>9:00</span> <span>AM</span>
																</a>
																<a class="timing" href="#">
																	<span>10:00</span> <span>AM</span>
																</a>
																<a class="timing" href="#">
																	<span>11:00</span> <span>AM</span>
																</a>
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

						</div>
</asp:Content>


