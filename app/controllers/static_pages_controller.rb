# frozen_string_literal: true

# This controller handles static pages.
class StaticPagesController < ApplicationController
  skip_before_action :require_login, only: %i[top terms use]

  def top; end

  def terms; end

  def after_login; end
  
  def use; end

end
