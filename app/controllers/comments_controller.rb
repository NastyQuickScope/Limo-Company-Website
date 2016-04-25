class CommentsController < ApplicationController 
    def new
        @var=comment.new 
        render "new"
    end
    def create
        @var=Comments.new
        @var.name=params["name"]
        @var.comments=params["comments"]
        @var.date=params["date"]
        @var.time=params["time"]
    end
    def show
        @var=Comments.find_by (params [:id])
        if @var.present
            render "show"
        else
            redirect_to comments_url, :notice => "The record doesn't exist"
        end
    end
    def index
        @var=Comments.all
        render "index"
    end
    def edit
        @var=Comments.find(params[:id])
        render "edit"
    end
    def update
        @var=Comments.find(params[:id])
        @var.name=params["name"]
        @var.comments=params["comments"]
        @var.date=params["date"]
        @var.time=params["time"]
        @var.save
        redirect.to comment_url (@var.id)
    end
end