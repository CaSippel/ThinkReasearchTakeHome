class PatientsController < ApplicationController
   def index
      @patients = Patient.all
   end

   def show
      @patient = Patient.find(params[:id])
   end

   def new
      @patient = Patient.new
   end

   def edit
      @patient = Patient.find(params[:id])
   end

   def create
      if params[:commit] == "Cancel"
         redirect_to patients_path
         return
      end

      @patient = Patient.new(patient_params)

      if @patient.save
         redirect_to @patient
      else
         render 'new'
      end
   end

   def update
      @patient = Patient.find(params[:id])

      if params[:commit] == "Cancel"
         redirect_to @patient
         return
      end

      if @patient.update(patient_params)
         redirect_to @patient
      else
         render 'edit'
      end
   end

   def destroy
      @patient = Patient.find(params[:id])
      @patient.destroy

      redirect_to patients_path
   end

private
   def patient_params
      params.require(:patient).permit(:first_name, :middle_name, 
         :last_name, :weight, :height, :mrn)
   end

end
