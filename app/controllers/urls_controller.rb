# frozen_string_literal: true

class UrlsController < ApplicationController
  def index
    # recent 10 short urls
    @url = Url.new
    @urls = Url.latest
  end

  def create
    @url = Url.new(url_params)
    if @url.save
      redirect_to @url
    else
      flash[:notice] = @url.errors.to_a.join(', ')
      redirect_to urls_path
    end
    # create a new URL record
  end

  def show
    @url = Url.new(short_url: 'ABCDE', original_url: 'http://google.com', created_at: Time.now)
    # implement queries
    @daily_clicks = [
      ['1', 13],
      ['2', 2],
      ['3', 1],
      ['4', 7],
      ['5', 20],
      ['6', 18],
      ['7', 10],
      ['8', 20],
      ['9', 15],
      ['10', 5]
    ]
    @browsers_clicks = [
      ['IE', 13],
      ['Firefox', 22],
      ['Chrome', 17],
      ['Safari', 7]
    ]
    @platform_clicks = [
      ['Windows', 13],
      ['macOS', 22],
      ['Ubuntu', 17],
      ['Other', 7]
    ]
  end

  def visit
    url = Url.find_by(short_url: params['short_url'])

    return redirect_to '/404.html' if url.nil?

    browser = Browser.new(request.user_agent, accept_language: 'en-us')
    Click.create!(
      url: url,
      browser: browser.name || 'Other',
      platform: browser.platform.to_s || 'Other'
    )
    redirect_to url.original_url
  end

  private

  def url_params
    params.require(:url).permit(:original_url)
  end
end
