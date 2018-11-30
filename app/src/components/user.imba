import { getUser } from '../services/api';
import { innerHtml } from '../services/shared';

export tag User
	prop user

	def mount
		@user = await getUser(router.path.split('/')[2])
		Imba.commit

	def unmount
		user = null

	def render
		<self>
			if user
				<div.user-container>
					<h1> user:id
					<ul.meta>
						<li>
							<span.label> 'Created:' 
							user:created
						<li>
							<span.label> 'Karma:'
							user:karma
						<li.about>
							innerHtml(user:about || '')
					<p.links>
						<a href="https://news.ycombinator.com/submitted?id={user:id}" target='_blank'> 'submissions'
						' | '
						<a href="https://news.ycombinator.com/threads?id={user:id}" target='_blank'> 'comments'
			else
				<div.loading-pulse>
