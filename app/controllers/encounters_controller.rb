class EncountersController < ApplicationController
   def index
      @patient = Patient.find(params[:patient_id])
      @encounters = @patient.encounters.all
   end

   def show
      @patient = Patient.find(params[:patient_id])
      @encounter = @patient.encounters.find(params[:id])
   end

   def new
      @patient = Patient.find(params[:patient_id])
      @encounter = Encounter.new 
   end

   def edit
      @patient = Patient.find(params[:patient_id])
      @encounter = @patient.encounters.find(params[:id])
   end

   def create
      #if params[:commit] == "Cancel"
      #   redirect_to patients_path
      #   return
      #end
      
      @patient = Patient.find(params[:patient_id])
      @encounter = @patient.encounters.create(encounter_params)

      if @encounter.save
         redirect_to patient_path(@patient)
      else
         render 'new'
      end
   end

private
      def encounter_params
         params.require(:encounter).permit(:visit_number, :admitted_at, :discharged_at, :location, :room, :bed)
      end
end
