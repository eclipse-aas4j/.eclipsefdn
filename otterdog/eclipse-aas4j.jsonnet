local orgs = import 'vendor/otterdog-defaults/otterdog-defaults.libsonnet';

orgs.newOrg('dt.aas4j', 'eclipse-aas4j') {
  settings+: {
    description: "",
    name: "Eclipse AAS Model for Java",
    web_commit_signoff_required: false,
    workflows+: {
      actions_can_approve_pull_request_reviews: false,
      default_workflow_permissions: "write",
    },
  },
  secrets+: [
    orgs.newOrgSecret('ORG_GPG_KEY_ID') {
      value: 'pass:bots/dt.aas4j/gpg/key_id',
    },
    orgs.newOrgSecret('ORG_GPG_PASSPHRASE') {
      value: 'pass:bots/dt.aas4j/gpg/passphrase',
    },
    orgs.newOrgSecret('ORG_GPG_PRIVATE_KEY') {
      value: 'pass:bots/dt.aas4j/gpg/secret-subkeys.asc',
    },
    orgs.newOrgSecret('ORG_OSSRH_PASSWORD') {
      value: 'pass:bots/dt.aas4j/central.sonatype.org/password',
    },
    orgs.newOrgSecret('ORG_OSSRH_USERNAME') {
      value: 'pass:bots/dt.aas4j/central.sonatype.org/username',
    },
  ],
  _repositories+:: [
    orgs.newRepo('aas4j') {
      allow_merge_commit: true,
      allow_update_branch: false,
      code_scanning_default_languages+: [
        "java-kotlin"
      ],
      code_scanning_default_setup_enabled: true,
      delete_branch_on_merge: false,
      description: "Eclipse AAS Model for Java",
      web_commit_signoff_required: false,
      workflows+: {
        default_workflow_permissions: "write",
      },
    },
    orgs.newRepo('aas4j-model-generator') {
      allow_merge_commit: true,
      allow_update_branch: false,
      delete_branch_on_merge: false,
      web_commit_signoff_required: false,
      workflows+: {
        default_workflow_permissions: "write",
      },
    },
    orgs.newRepo('aas4j-transformation-library') {
      allow_merge_commit: true,
      allow_update_branch: false,
      code_scanning_default_languages+: [
        "java-kotlin"
      ],
      code_scanning_default_setup_enabled: true,
      delete_branch_on_merge: false,
      web_commit_signoff_required: false,
      workflows+: {
        default_workflow_permissions: "write",
      },
    },
  ],
} + {
  # snippet added due to 'https://github.com/EclipseFdn/otterdog-configs/blob/main/blueprints/add-dot-github-repo.yml'
  _repositories+:: [
    orgs.newRepo('.github')
  ],
}
