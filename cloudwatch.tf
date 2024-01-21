resource "awscc_cloudwatch_alarm" "efs-connections" {
  alarm_name          = "Triggers-100-connections-per-5min"
  comparison_operator = "GreaterThanThreshold"
  evaluation_periods  = 1
  metric_name         = "ClientConnections"
  namespace           = "AWS/EFS"
  period              = 300
  threshold           = 100
  statistic           = "Maximum"
}

#Deployed manually from AWS Console to test it and there are differences between the resource in terraform and in the console. I couldn't finish it.