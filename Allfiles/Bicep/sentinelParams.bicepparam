using './Sentinel.bicep'

param workspaceName = 'defenderWorkspace'
param retentionInDays = 90
param contentSolutions = [
  'Microsoft Defender For Cloud'
  'Sentinel SOAR Essentials'
  'Azure Activity'
  'Windows Security Events'
  'Common Event Format'
  'Syslog'
  'Threat Intelligence'
]
