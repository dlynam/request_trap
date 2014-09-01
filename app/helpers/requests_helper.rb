module RequestsHelper
  def format_headers(headers)
    output = ''
    output += content_tag :div, "#{headers['REQUEST_METHOD']} #{headers['REQUEST_URI']} #{headers['SERVER_PROTOCOL']}", class: 'header-line'
    output += content_tag :div, "Host: #{headers['HOST']}", class: 'header-line'
    output += content_tag :div, "User-Agent: #{headers['USER_AGENT']}", class: 'header-line'
    output += content_tag :div, "Accept: #{headers['ACCEPT']}", class: 'header-line'
    output += content_tag :div, "Accept-language: #{headers['ACCEPT_LANGUAGE']}", class: 'header-line'
    output += content_tag :div, "Accept-encoding: #{headers['ACCEPT_ENCODING']}", class: 'header-line'
    output += content_tag :div, "Connection: #{headers['CONNECTION']}", class: 'header-line'
    output += content_tag :div, "Content-type: #{headers['CONTENT_TYPE']}", class: 'header-line'
    output.html_safe
  end
end
