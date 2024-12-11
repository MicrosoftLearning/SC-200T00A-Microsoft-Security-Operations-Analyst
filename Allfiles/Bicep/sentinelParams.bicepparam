using './Sentinel.bicep'

param workspaceName = 'defenderworkspace'
param retentionInDays = 90
param contentSolutions = [
  'Microsoft Defender For Cloud'
  'Sentinel SOAR Essentials'
  'Azure Activity'
  'Windows Security Events'
  'Common Event Format'
  'Syslog'
]
