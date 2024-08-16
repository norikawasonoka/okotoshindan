class Diagnosis2sController < ApplicationController
    def index
        @diagnosis = Diagnosis.find_by(id: params[:id])
      end
  
      def new
        @diagnosis2 = Diagnosis2.new
      end
    
      def show
        @diagnosis2 = Diagnosis2.find_by(id: params[:id])
        @diagnosis3 = Diagnosis3.new
      end
    
      def create
        @diagnosis2 = Diagnosis2.new(diagnosis_params)
      #params[:topic][:question] ? @topic.question = params[:topic][:question].join("") : false
        if @diagnosis2.save
            flash[:notice] = "診断が完了しました"
            redirect_to diagnosis_path(@diagnosis2.id)
        else
            redirect_to :action => "new"
        end
      end
    
    private
      def diagnosis_params
          params.require(:diagnosis).permit(:question)
      end
    end