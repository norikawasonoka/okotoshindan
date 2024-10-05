# frozen_string_literal: true

# Represents the controller for Okotos.
class OkotosController < ApplicationController
  skip_before_action :require_login
  def index; end

  def plays; end
end
