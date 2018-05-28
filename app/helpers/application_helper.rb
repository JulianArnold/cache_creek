module ApplicationHelper
  # This method generates a dismissible bootstrap alert.
  # Inputs:
  # - message:   The message that you want the user to see.
  # - style:     Sets the colour scheme of the alert. Possible values are:
  #              - success:  green
  #              - info:     blue (default)
  #              - danger:   red
  def alert_box(message, style = 'info')
    return nil unless message.present?
    style = 'info' unless %w[success info danger].include?(style)
    content_tag(:div, class: "alert alert-#{style} alert-dismissible", role: 'alert') do
      content_tag(:button, class: 'close', type: 'button', data: { dismiss: 'alert' }, aria: {label: 'Close' }) do
        content_tag(:span, sanitize('&times;'), aria: { hidden: true })
      end + message
    end
  end

  def phone_to(phone_number)
    return nil if phone_number.blank?
    link_to phone_number, 'tel:' + phone_number
  end

  def sms_to(phone_number)
    # return nil unless phone_number.present?
    return nil if phone_number.blank?
    link_to t('activerecord.attributes.send_sms'), 'sms:' + phone_number, class: 'text-muted'
  end

  def skype_to(skype_id)
    return nil if skype_id.blank?
    link_to skype_id, 'skype:' + skype_id
  end

  def linkedin_to(the_url)
    return nil if the_url.blank?
    link_to the_url, target: :_blank, title: 'Open in a new tab' do
      concat(the_url)
      concat(' ')
      concat(content_tag(:span, '', class: 'glyphicon glyphicon-new-window'))
    end
  end

  def page_heading(page_title, sub_title = nil)
    return nil if page_title.blank?
    content_tag(:div, class: 'row') do
      content_tag(:div, class: 'col-sm-12') do
        content_tag(:div, class: 'page-header') do
          content_tag(:h1, page_title) +
              (sub_title.present? ? content_tag(:p, sub_title, class: 'lead') : '')
        end
      end
    end
  end
end
